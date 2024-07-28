// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Calender(),
    );
  }
}

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  int today = 0;
  int month = 0;
  int todayNumber = 0;
  int year = 0;
  int hour = 0;
  int min = 0;
  int sec = 0;
  String str = "";
  List days = [
    "",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Therusday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List months = [
    "",
    "January",
    "February",
    "March",
    "April",
    "May",
    "Jun",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  changeDateTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        today = DateTime.now().day;
        month = DateTime.now().month;
        year = DateTime.now().year;
        todayNumber = DateTime.now().weekday;
        hour = DateTime.now().hour;
        if (hour > 12) {
          hour -= 12;
        }
        min = DateTime.now().minute;
        sec = DateTime.now().second;
      });
    });
  }

  print_hi() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        str = "Hi ^_^";
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeDateTime();
    print_hi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 34),
      appBar: AppBar(
        title: Text(
          "Date and Time APP",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is ${days[todayNumber]}",
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${months[month]} $today , $year",
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${hour.toString().padLeft(2, "0")} : ${min.toString().padLeft(2, "0")} : ${sec.toString().padLeft(2, "0")}",
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
              SizedBox(
              height: 30,
            ),
            Text(
              str,
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
          ],
        ),
      ),
    );
  }
}
