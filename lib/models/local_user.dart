// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'enums/gender.dart';

part 'local_user.g.dart';



@HiveType(typeId: 2)
class LocalUser {
  @HiveField(0)
  String name;

  @HiveField(1)
  Gender gender;

  @HiveField(2)
  String avatarPath;

  LocalUser({
    required this.name,
    required this.gender,
    required this.avatarPath,
  });

  LocalUser copyWith({
    String? name,
    Gender? gender,
    String? avatarPath,
  }) {
    return LocalUser(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
