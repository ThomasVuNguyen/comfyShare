import 'package:flutter/material.dart';

import '../UniversalVariables.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width:2 ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(6, 6),
            )
          ]
      ),

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text("download",style: DownloadStyle,),
      ),
    );
  }
}
