import 'package:flutter/material.dart';

import 'main.dart';

Future<void> AddSpace(String name, String title, String owner ) async{
  await supabase.from('test').insert([
    {'name':name, 'title': title, 'owner': owner}],
  );
}

class AddNewSpaceWidget extends StatefulWidget {
  const AddNewSpaceWidget({super.key});

  @override
  State<AddNewSpaceWidget> createState() => _AddNewSpaceWidgetState();
}

class _AddNewSpaceWidgetState extends State<AddNewSpaceWidget> {
  @override
  Widget build(BuildContext context) {
    const EmptyInfo = SnackBar(
      content: Text('Info cannot be empty'),
    );
    String name = ''; String title =''; String owner = '';
    return AlertDialog(
      title: const Text('Share a Space'),
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Space Name',
              border: OutlineInputBorder(),
            ),
            onChanged: (String txt){
              name = txt;
            },
            textInputAction: TextInputAction.next,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Give it a quick title',
              border: OutlineInputBorder(),
            ),
            onChanged: (String txt){
              title = txt;
            },
            textInputAction: TextInputAction.next,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Your name!',
              border: OutlineInputBorder(),
            ),
            onChanged: (String txt){
              owner = txt;
            },
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
      actions: [
        MaterialButton(
          child: Text('Cancel'),
            onPressed: (){
          Navigator.pop(context);
        }),
        MaterialButton(
          child: Text('Share Space!'),
            onPressed: (){
          if(name != '' && title != '' && owner !=''){
            AddSpace(name, title, owner);
            Navigator.pop(context);
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(EmptyInfo);
          }

        })
      ],
    );
  }
}
