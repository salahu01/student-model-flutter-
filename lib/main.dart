import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students_data/add_student.dart';
import 'package:students_data/edit.dart';
import 'package:students_data/functions/functions.dart';

import 'package:students_data/model/data.dart';
import 'package:students_data/search.dart';
import 'package:students_data/student_details.dart';
import 'package:students_data/students_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: const StudentsList(),
      //  home: AddStudent(),
      routes: {
        'addStudent': (context) {
          return const AddStudent();
        },
        'studentsList': (context) {
          return const StudentsList();
        },
        'studentDetails': (context) {
          return const StudentDetails();
        },
        'search':((context) {
          return Search();
        }),
        // 'edit':((context) {
        //   return Edit();
        // }),
      },
    );
  }
}
