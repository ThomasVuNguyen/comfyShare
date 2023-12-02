import 'dart:io';

import 'package:comfyshare/dababase_function.dart';
import 'package:comfyshare/widgets/FileUploadButton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../StateManagement/ProviderState.dart';
import '../main.dart';

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
  late String SpaceName; late String title; late String creator;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text('Add a space to the void'),
            content: Text('Insert space information'),
            actions: [
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Space Name'
                ),
                textInputAction: TextInputAction.next,
                onChanged: (text){
                  SpaceName = text;
                },),
              Gap(10),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Title'
                ),
                textInputAction: TextInputAction.next,
                onChanged: (text){
                  title = text;
                },),
              Gap(10),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Creator name'
                ),
                textInputAction: TextInputAction.next,
                onChanged: (text){
                  creator = text;
                },),
              Gap(10),
              FileUploadButton(InformationContained: 'comfy'),
              Gap(10),
              FileUploadButton(InformationContained: 'md'),
              Gap(10),
              FileUploadButton(InformationContained: 'gif'),
              Gap(20),
              TextButton(onPressed: (){
                /*
            UploadAFile(context.watch<UploadInformation>().SpaceUploadInformation['comfy']!, SpaceName, title, 'comfy');
            UploadAFile(context.watch<UploadInformation>().SpaceUploadInformation['md']!, SpaceName, title, 'md');
            UploadAFile(context.watch<UploadInformation>().SpaceUploadInformation['gif']!, SpaceName, title, 'gif');
            */

              },
                  child: Text('Upload')),

            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100, height: 100,
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

class AddNewSpaceDialog extends StatefulWidget {
  const AddNewSpaceDialog({super.key});

  @override
  State<AddNewSpaceDialog> createState() => _AddNewSpaceDialogState();
}

class _AddNewSpaceDialogState extends State<AddNewSpaceDialog> {
  late String SpaceName; late String title; late String creator;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => UploadInformation()),
      ],
      child: AlertDialog(
        title: Text('Add a space to the void'),
        content: Text('Insert space information'),
        actions: [
          TextField(
            decoration: const InputDecoration(
                labelText: 'Space Name'
            ),
            textInputAction: TextInputAction.next,
            onChanged: (text){
              SpaceName = text;
            },),
          Gap(10),
          TextField(
            decoration: const InputDecoration(
                labelText: 'Title'
            ),
            textInputAction: TextInputAction.next,
            onChanged: (text){
              title = text;
            },),
          Gap(10),
          TextField(
            decoration: const InputDecoration(
                labelText: 'Creator name'
            ),
            textInputAction: TextInputAction.next,
            onChanged: (text){
              creator = text;
            },),
          Gap(10),
          FileUploadButton(InformationContained: 'comfy'),
          Gap(10),
          FileUploadButton(InformationContained: 'md'),
          Gap(10),
          FileUploadButton(InformationContained: 'gif'),
          Gap(20),
          TextButton(onPressed: (){
            /*
              UploadAFile(context.watch<UploadInformation>().SpaceUploadInformation['comfy']!, SpaceName, title, 'comfy');
              UploadAFile(context.watch<UploadInformation>().SpaceUploadInformation['md']!, SpaceName, title, 'md');
              UploadAFile(context.watch<UploadInformation>().SpaceUploadInformation['gif']!, SpaceName, title, 'gif');
              */

          },
              child: Text('Upload')),

        ],
      ),
    );
  }
}




