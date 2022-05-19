import 'package:abdalla_mansour_course1/modules/archived_tasks/archived.dart';
import 'package:abdalla_mansour_course1/modules/done_tasks/done.dart';
import 'package:abdalla_mansour_course1/modules/new_tasks/new_tasks.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> screens = [
    TasksScreen(),
    DoneScreen(),
    ArchivedScreen(),

  ];
  List<String> titles = ["New Tasks", "Done Tasks", "Archived Tasks"];
  bool isBottomSheetShown = false;
  Database database;
  var labelController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  IconData febIcon=Icons.edit;
  var formKey=GlobalKey<FormState>();
  @override
  void initState() {
    createDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        tooltip: "Add",
        onPressed: () {
          if (isBottomSheetShown) {
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              febIcon=Icons.edit;

            });

          } else {
            scaffoldKey.currentState.showBottomSheet((context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: labelController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.text_fields),
                          labelText: "Task Name",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: timeController,
                        onTap:(){
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now()).
                          then((value)  {
                            timeController.text=value.format(context).toString();
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.watch_later_outlined),
                          labelText: "Task Time",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: dateController,
                        onTap: (){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020-1-1),

                            lastDate:DateTime(2021-12-30),

                          );
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.date_range),
                          labelText: "Task Date",
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
            isBottomSheetShown = true;
            setState(() {
              febIcon=Icons.add;
            });

          }
        },
        child: Icon(febIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Tasks",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Done"),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: "Archived",
          ),
        ],
      ),
    );
  }

  void createDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
          database
              .execute(
              'CREATE TABLE tasks (ID INTEGER PRIMARY KEY, title TEXT ,date TEXT,time TEXT , status TEXT)')
              .then((value) {
            print("database created");
          }).catchError((error) {
            print(error);
          });
        }, onOpen: (database) {
          print("database opened");
        });
  }

  void insertIntoDatabase() {
    database.transaction((txn) {
      txn
          .rawInsert(
          'INSERT INTO tasks(title,date,time,status) ,VALUES("title","date","time","status")')
          .then((value) {
        print(value);
      }).catchError((error) {
        print(error);
      });
      return null;
    });
  }
}
