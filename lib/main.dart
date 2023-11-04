import 'package:comfyshare/DarkTheme.dart';
import 'package:comfyshare/SpaceCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'AddNewSpace.dart';
import 'HomeScreen.dart';
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
      title: 'ComfyShare',
      debugShowCheckedModeBanner: false,
      darkTheme: DarkTheme,
      theme: DarkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

