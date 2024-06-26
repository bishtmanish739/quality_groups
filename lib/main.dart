import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
//https://quality-groups-default-rtdb.asia-southeast1.firebasedatabase.app/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatefulWidget { 
  @override 
  _MyAppState createState() => _MyAppState(); 
} 
  
class _MyAppState extends State<MyApp> { 
  final _form = GlobalKey<FormState>(); 
  String ? title; 
  void writeData() async { 
    _form.currentState?.save(); 
      
    // Please replace the Database URL 
    // which we will get in “Add Realtime 
    // Database” step with DatabaseURL 
    var url = "https://quality-groups-default-rtdb.asia-southeast1.firebasedatabase.app/"; 
      
    // (Do not remove “data.json”,keep it as it is) 
    try { 
      
      final response = await http.post( 
        Uri.parse(url), 
        body: json.encode({"title": title}), 
      ); 
    } catch (error) { 
      throw error; 
    } 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'RealTime Database', 
      theme: ThemeData( 
        primarySwatch: Colors.green, 
      ), 
      home: Scaffold( 
        appBar: AppBar( 
          title: Text("GeeksforGeeks"), 
        ), 
        body: Form( 
          key: _form, 
          child: Center( 
            child: Column( 
              children: [ 
                SizedBox( 
                  height: 10, 
                ), 
                TextFormField( 
                  decoration: InputDecoration(hintText: "Enter Title"), 
                  onSaved: (value) { 
                    title = value; 
                  }, 
                ), 
                SizedBox( 
                  height: 10, 
                ), 
                TextButton( 
                    onPressed: writeData, 
                    
                    child: Text( 
                      "Submit", 
                      style: TextStyle(color: Colors.white), 
                      textAlign: TextAlign.center, 
                    )), 
              ], 
            ), 
          ), 
        ), 
      ), 
    ); 
  } 
}