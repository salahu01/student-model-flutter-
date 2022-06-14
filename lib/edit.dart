import 'package:flutter/material.dart';
import 'package:students_data/add_student.dart';
import 'package:students_data/functions/functions.dart';
import 'package:students_data/model/data.dart';

class Edit extends StatelessWidget {
  final String name1;
  final String age1;
  final String mail1;
  final String phone1;
  final int? index;
  
  Edit(
      {Key? key,
      required this.name1,
      required this.age1,
      required this.mail1,
      required this.phone1,
      required this.index,})
      : super(key: key);
  final name = TextEditingController();
  final age = TextEditingController();
  final mail = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = name1;
    age.text = age1;
    mail.text = mail1;
    phone.text = phone1;
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
                      TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: name,
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
                          controller: age,
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
                          controller: mail,
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
                          controller: phone,
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
                      update(index: index);
                      Navigator.of(context).pushNamed('studentsList');
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

  Future<void> update({required index}) async {
    final name1 = name.text;
    final age1 = age.text;
    final mail1 = mail.text;
    final phone1 = phone.text;
    if (name1.isEmpty || age1.isEmpty || mail1.isEmpty || phone1.isEmpty) {
      return;
    } else {
      final data =
          StudentModel(name: name1, age: age1, mail: mail1, phone: phone1);
      await edit(index: index,data: data);
    }
  }
}
