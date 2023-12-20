import 'package:hive/hive.dart';

part 'local_user.g.dart';

enum Gender {
  male,
  female,
  other,
}

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
}