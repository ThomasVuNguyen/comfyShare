import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'AddNewSpace.dart';
import 'SpaceListRender.dart';
import 'dababase_function.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://xkcmereksgicntthotgx.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhrY21lcmVrc2dpY250dGhvdGd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTgxMTM1NzMsImV4cCI6MjAxMzY4OTU3M30.SqEmOU_BMRJOn2bXbCiGCLNTt_WnMqVVtch0feLcvWI',
  );
  runApp(const MyApp());
}
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: Text('Add Space'),
                  color: Colors.cyan,
                  onPressed: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return const AddNewSpaceWidget();
                    });
                  },
              ),
              MaterialButton(
                child: Text('Delete Space'),
                color: Colors.red,
                onPressed: (){
                  DeleteSpace('spacename','title','owner');
                },
              )
            ],
          ),
          SpaceList(),
        ],
      ),
    );
  }
}
