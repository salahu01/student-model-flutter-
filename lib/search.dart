import 'package:flutter/material.dart';
import 'package:students_data/functions/functions.dart';
import 'package:students_data/model/data.dart';

final search = TextEditingController();
ValueNotifier<List<StudentModel>> temp = ValueNotifier([]);

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  get StudentDetails_screen => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(31, 255, 255, 255),
                          filled: true,
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: (String? value) {
                        if (value == null || value == value.isEmpty) {
                          temp.value.addAll(studentListNotifier.value);
                          temp.notifyListeners();
                        } else {
                          temp.value.clear();
                          for (StudentModel i in studentListNotifier.value) {
                            if (i.name
                                .toLowerCase()
                                .contains(value.toLowerCase())) {
                              temp.value.add(i);
                            }
                            temp.notifyListeners();
                          }
                        }
                      },
                      controller: search,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.72,
                  color: const Color.fromARGB(31, 255, 255, 255),
                  child: ValueListenableBuilder(
                    valueListenable: temp,
                    builder: (BuildContext context, List<StudentModel> searchData,
                        Widget? child) {
                      return ListView.separated(
                          itemBuilder: ((context, index) {
                            final data = searchData[index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  color: const Color.fromARGB(24, 255, 255, 255),
                                child: ListTile(
                                  title: Text(
                                    data.name,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('studentDetails', arguments: data);
                                  },
                                   shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            );
                          }),
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: searchData.length);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
