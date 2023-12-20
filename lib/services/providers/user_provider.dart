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
          gender: Gender.male,
          avatarPath: 'assets/images/avatar.png',
        )){
          state = userBox.get('userKey')!;
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
