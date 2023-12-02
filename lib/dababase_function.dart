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