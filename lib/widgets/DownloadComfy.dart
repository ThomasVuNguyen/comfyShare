import 'package:dio/dio.dart';
import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../secrets/RetrieveSecret.dart';

class DownloadComfyFileButton extends StatelessWidget {
  const DownloadComfyFileButton({super.key, required this.SpaceName, required this.title});
  final String? SpaceName; final String? title;


  Future<void> DownloadComfy() async {
    /*final MarkdownURL = Uri.parse('$SupabaseSpaceFileStoragePath/${SpaceName}-${title}/${SpaceName}-${title}.comfy');

    String ComfyContent = await http.read(MarkdownURL);
    final stream = Stream.fromIterable(ComfyContent.codeUnits);
    download(stream,'${SpaceName}-${title}.comfy');*/
    final Uri url = Uri.parse('$SupabaseSpaceFileStoragePath/${SpaceName}-${title}/${SpaceName}-${title}.comfy');
    if (!await launchUrl(url, mode:LaunchMode.externalNonBrowserApplication)){
      throw Exception('Could not download comfy file');
    };
  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          DownloadComfy();
        },
      child: Icon(Icons.download),
        );
  }
}
