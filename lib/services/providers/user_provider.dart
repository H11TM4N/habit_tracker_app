import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/local_user.dart';

import '../../models/enums/gender.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier()
      : super(LocalUser(
          name: 'Hermano',
          gender: Gender.unknown,
          avatarPath: 'assets/images/avatar.png',
        )) {
    // Check if the user data exists in userBox
    if (userBox.containsKey('userKey')) {
      state = userBox.get('userKey')!;
    } else {
      // If not, create a new default user and save it to userBox
      _createDefaultUser();
    }
  }

  void _createDefaultUser() {
    state = LocalUser(
      name: 'Hermano',
      gender: Gender.unknown,
      avatarPath: 'assets/images/avatar.png',
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

  void clearData() {
    if (userBox.isNotEmpty) {
      userBox.clear();
    }
  }

  // void changeAvatarPath(String newAvatarPath) {
  //   state = state.copyWith(avatarPath: newAvatarPath);
  //   _saveToHive();
  // }

  void _saveToHive() {
    userBox.put('userKey', state);
  }
}
