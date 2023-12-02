import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../secrets/RetrieveSecret.dart';

class SpaceDescription extends StatefulWidget {
  const SpaceDescription({super.key, required this.SpaceName, required this.title});
  final String? SpaceName; final String? title;
  @override
  State<SpaceDescription> createState() => _SpaceDescriptionState();
}

class _SpaceDescriptionState extends State<SpaceDescription> {

  @override
  initState(){
    super.initState();

  }

  Future<String> RetrieveMarkdown() async{
    final MarkdownURL = Uri.parse('$SupabaseSpaceFileStoragePath/${widget.SpaceName}-${widget.title}/${widget.SpaceName}-${widget.title}.md');

    return http.read(MarkdownURL);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RetrieveMarkdown(),
        builder: (BuildContext context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return Flexible(child: Container(child: Markdown( selectable: true, data: snapshot.data!)));
        }
        return Flexible(child: Container(child: Markdown( selectable: true, data: 'Loading')));
    });
  }
}
