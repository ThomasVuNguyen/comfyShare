import 'package:flutter/cupertino.dart';

import '../UniversalVariables.dart';

class DownloadCount extends StatelessWidget {
  const DownloadCount({super.key, required this.download});
  final String? download;
  @override
  Widget build(BuildContext context) {
    return Text('Downloads: $download',style: DownloadCountStyle,);
  }
}
