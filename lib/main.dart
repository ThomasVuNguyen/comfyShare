import 'package:comfyshare/theme/DarkTheme.dart';
import 'package:comfyshare/widgets/SpaceCard.dart';
import 'package:comfyshare/secrets/RetrieveSecret.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'widgets/AddNewSpace.dart';
import 'HomeScreen.dart';

import 'dababase_function.dart';

Future<void> main() async {
  print('This URL is $SupabaseURL');
  await Supabase.initialize(
      url: SupabaseURL,
      anonKey: SupabaseanonKey,
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

