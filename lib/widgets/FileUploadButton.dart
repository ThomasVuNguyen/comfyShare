import 'dart:io';

import 'package:comfyshare/StateManagement/ProviderState.dart';
import 'package:comfyshare/dababase_function.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FileUploadButton extends StatefulWidget {
  const FileUploadButton({super.key, required this.InformationContained});
  final String InformationContained;
  @override
  State<FileUploadButton> createState() => _FileUploadButtonState();
}

class _FileUploadButtonState extends State<FileUploadButton> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => UploadInformation()),
      ],
      child: Column(
        children: [
          Text('Upload ${widget.InformationContained} file'),
          ElevatedButton(onPressed: () async {


            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: [widget.InformationContained],
            );

            if (result != null) {
              File file = File(result.files.single.path!);
            } else {
              // User canceled the picker
            }

          }, child: Text(
            context.watch<UploadInformation>().SpaceUploadInformation[widget.InformationContained]!
          )),
        ],
      ),
    );
  }
}
