import 'package:app/login.page.dart';
import 'package:flutter/material.dart';
import 'banco/FirebaseCustom.dart';

void main(){
  FirebaseHelper.initDatabase();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginPage(),
    ),
  );
} 
