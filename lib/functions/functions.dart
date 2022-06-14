import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../model/data.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
Future<void> addStudent({required StudentModel value}) async {
  final studentdb = await Hive.openBox<StudentModel>('student');
  await studentdb.add(value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllstudents() async {
  final studentdb = await Hive.openBox<StudentModel>('student');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentdb.values);
  studentListNotifier.notifyListeners();
}

Future<void> delete(int index) async {
  final studentdb = await Hive.openBox<StudentModel>('student');
  await studentdb.delete(index);
  getAllstudents();
}
Future<void> edit({required int index,data}) async{
  final studentdb = await Hive.openBox<StudentModel>('student');
  await studentdb.put(index,data );
  getAllstudents();
}