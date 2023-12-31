import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/local_user.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/enums/gender.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier()
      : super(LocalUser(
          name: 'Hermano',
          gender: Gender.unknown,
        )) {
    // Check if the user data exists in userBox
    if (userBox.containsKey('userKey')) {
      state = userBox.get('userKey')!;
    } else {
      // If not, create a new default user and save it to userBox
      _createDefaultUser();
    }
  }
  final _picker = ImagePicker();

  void _createDefaultUser() {
    state = LocalUser(
      name: 'Hermano',
      gender: Gender.unknown,
    );
    _saveToHive();
  }

  void changeUsername(String newName) {
    if (newName.isNotEmpty) {
      state = state.copyWith(name: newName);
    }
    _saveToHive();
  }

  void changeGender(Gender newGender) {
    state = state.copyWith(gender: newGender);
    _saveToHive();
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = File(pickedFile.path).readAsBytesSync();
      state.avatarPath = Uint8List.fromList(bytes);
      state = state.copyWith(avatarPath: Uint8List.fromList(bytes));
    }
    _saveToHive();
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final bytes = File(pickedFile.path).readAsBytesSync();
      state.avatarPath = Uint8List.fromList(bytes);
      state = state.copyWith(avatarPath: Uint8List.fromList(bytes));
    }
    _saveToHive();
  }

  void clearData() {
    userBox.clear();
    _createDefaultUser();
  }

  // void changeAvatarPath(String newAvatarPath) {
  //   state = state.copyWith(avatarPath: newAvatarPath);
  //   _saveToHive();
  // }

  void _saveToHive() {
    userBox.put('userKey', state);
  }
}
