import 'main.dart';

Future<void> AddSpace(String name, String title, String owner ) async{
  await supabase.from('test').insert([
    {'name':name}],
  );
}


Future<void> DeleteSpace(String name, String title, String owner ) async{

}

Future<void> EditSpace(String name, String title, String owner, String newName, String newTitle ) async{

}
Future<void> SpaceListRender() async{

}

Future<void> SpaceRender() async{

}