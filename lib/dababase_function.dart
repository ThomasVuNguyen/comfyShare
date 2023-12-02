
import 'dart:io' as io;
//import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'main.dart';

Future<void> DeleteSpace(String name, String title, String owner ) async{

}

Future<void> EditSpace(String name, String title, String owner, String newName, String newTitle ) async{

}
Future<List<Map<dynamic, dynamic>>> SpaceListRender() async{
  final List<Map<dynamic, dynamic>> data = await supabase.from("Space List").select();
  print(data.toString());
  return data;
}

Future<void> SpaceRender() async{
}

Future<void> AddSpaceToDatabase(String SpaceName, String title, String creator) async{
  await supabase.from('Space List').insert({'Space Name': SpaceName,'title':title, 'Creator':creator} );
}
/*
Future<void> UploadAFile(String SpaceName, String title, String type) async{
  if(kIsWeb){
    late var fileByte;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [type],
    );

    if (result != null) {
      fileByte = result.files.first.bytes;
    } else {
      // User canceled the picker
    }

    final String path = await supabase.storage.from('Space File').uploadBinary(
      '$SpaceName-$title/$SpaceName-$title.$type',
      fileByte,
      fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
    );

  }
  /*else{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [type],
    );

    if (result != null) {
      io.File file = io.File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
    final file = io.File(FilePath);
    final String path = await supabase.storage.from('Space File').upload(
      '$SpaceName-$title/$SpaceName-$title.$type',
      file,
      fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
    );

  }*/


} */


