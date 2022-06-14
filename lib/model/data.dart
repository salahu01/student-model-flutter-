import 'package:hive/hive.dart';
part 'data.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
    int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String mail;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String? image;

  StudentModel(
      {required this.name,
      required this.age,
      required this.mail,
      required this.phone,
      this.image,
      this.id
      });
}