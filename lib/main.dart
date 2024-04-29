import 'package:admin/login.dart';
import 'package:admin/login1.dart';
import 'package:admin/myhome.dart';
import 'package:flutter/material.dart';
import 'package:admin/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Halaman Admin",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: Mycoba(),
    );
  }
}
