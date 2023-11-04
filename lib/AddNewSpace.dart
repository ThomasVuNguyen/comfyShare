import 'package:flutter/material.dart';

import 'main.dart';

Future<void> AddSpace(String name, String title, String creator, String documentation) async{
  await supabase.from('Space List').insert([
    {'Space Name':name, 'Title': title, 'Documentation':documentation, 'Creator': creator, 'Download':0}],
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
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xffF9B803),
              border: Border.all(color: Colors.black, width:1 ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                )]),

          child: const Padding(
            padding: EdgeInsets.all(.0),
            child: Icon(Icons.add, size: 20,color: Colors.black,),
          ),
        ),
      ),
    );
  }
}
