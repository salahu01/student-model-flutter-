import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:students_data/edit.dart';
import 'package:students_data/functions/functions.dart';
import 'package:students_data/model/data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({Key? key}) : super(key: key);

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  @override
  Widget build(BuildContext context) {
    getAllstudents();
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Students Details',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 29,
                              fontWeight: FontWeight.w700)),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('search');
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromARGB(31, 255, 255, 255),
                ),
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .08,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(31, 255, 255, 255),
                    ),
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .76,
                    child: ValueListenableBuilder(
                      valueListenable: studentListNotifier,
                      builder: (BuildContext context,
                          List<StudentModel> studentList, Widget? child) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            final data = studentList[index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                color: const Color.fromARGB(24, 255, 255, 255),
                                child: Slidable(
                                  
                                  child: ListTile(

                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Edit(
                                                              name1: data.name,
                                                              age1: data.age,
                                                              mail1: data.mail,
                                                              phone1:
                                                                  data.phone,
                                                              index: index)));
                                            },
                                            icon: const Icon(
                                              Icons.edit_note_rounded,
                                              color: Colors.white,
                                            )),
                                        CircleAvatar(
                                          backgroundImage: MemoryImage(
                                              const Base64Decoder().convert(
                                                  data.image.toString())),
                                        ),
                                        
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        'studentDetails',
                                        arguments: data,
                                      );
                                    },
                                    title: Text(
                                      '${index + 1}-  ${data.name}',
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                  ),
                                  
                               
                                  
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return const Divider();
                          },
                          itemCount: studentList.length,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('addStudent');
          },
          child: const Icon(Icons.add)),
    ));
  }
}
