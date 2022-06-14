import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:students_data/functions/functions.dart';
import 'package:students_data/model/data.dart';
import 'package:image_picker/image_picker.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  String image = '';
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text('Add Students Details',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: MediaQuery.of(context).textScaleFactor * 24,
                        fontWeight: FontWeight.w700)),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color.fromARGB(31, 255, 255, 255),
              ),
              width: MediaQuery.of(context).size.width * .94,
              height: MediaQuery.of(context).size.height * .08,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(31, 255, 255, 255),
                  ),
                  width: MediaQuery.of(context).size.width * .3,
                  height: MediaQuery.of(context).size.height * .7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Photo :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Name :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Age :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Email :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Phone :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: MemoryImage(const Base64Decoder()
                                .convert(image.toString())),
                          ),
                          TextButton (
                              onPressed: () {
                                addImage();
                                
                              },
                              child: const Text('Add photo'),
                              
                              )
                        ],
                      ),
                      TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: _name,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20)))),
                      TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: _age,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20)))),
                      TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: _email,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20)))),
                      TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: _phone,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20)))),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(31, 255, 255, 255),
                  ),
                  width: MediaQuery.of(context).size.width * .61,
                  height: MediaQuery.of(context).size.height * .7,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.7),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    )),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                IconButton(
                    onPressed: () {
                      addClicked();
                    },
                    icon: const Icon(
                      Icons.save_outlined,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }

  Future<void> addClicked() async {
    final _name1 = _name.text.trim();
    final _age1 = _age.text.trim();
    final _email1 = _email.text.trim();
    final _phone1 = _phone.text.trim();

    if (_name1.isEmpty ||
        _age1.isEmpty ||
        _email1.isEmpty ||
        _phone1.isEmpty ||
        image.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Enter values',
        style: TextStyle(color: Colors.white),
      )));
    } else {
      final model = StudentModel(
          name: _name1,
          age: _age1,
          mail: _email1,
          phone: _phone1,
          image: image);
      await addStudent(value: model);
      _name.clear();
      _age.clear();
      _email.clear();
      _phone.clear();

      Navigator.of(context).pop();
    }
  }

  addImage() async {
    ImagePicker picker = ImagePicker();
    final imagepick =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagepick == null) {
      return;
    } else {
      final bytes = File(imagepick.path).readAsBytesSync();
      image = base64Encode(bytes);
      setState(() {
      });
    }
  }
}
