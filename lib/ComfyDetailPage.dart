import 'package:comfyshare/secrets/RetrieveSecret.dart';
import 'package:comfyshare/widgets/AppBar.dart';
import 'package:comfyshare/widgets/ComfySpaceDocumentation.dart';
import 'package:comfyshare/widgets/DownloadComfy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gap/gap.dart';

class ComfyDetailPage extends StatefulWidget {
  const ComfyDetailPage({super.key, required this.SpaceName, required this.title});
  final String? SpaceName; final String? title;
  @override
  State<ComfyDetailPage> createState() => _ComfyDetailPageState();
}

class _ComfyDetailPageState extends State<ComfyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DownloadComfyFileButton(SpaceName: widget.SpaceName, title: widget.title,),
      appBar: ComfyShareAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${widget.SpaceName}-${widget.title}'),
            Gap(100),
            Image.network('$SupabaseSpaceFileStoragePath/${widget.SpaceName}-${widget.title}/${widget.SpaceName}-${widget.title}.gif', width: 120,),
            SpaceDescription(SpaceName: widget.SpaceName, title: widget.title)
          ],
        ),
      ),
    );
  }
}
