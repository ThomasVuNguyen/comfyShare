import 'package:comfyshare/ComfyDetailPage.dart';
import 'package:comfyshare/UniversalVariables.dart';
import 'package:comfyshare/secrets/RetrieveSecret.dart';
import 'package:comfyshare/widgets/DownloadButton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'DownloadCount.dart';

class SpaceCard extends StatefulWidget {
  const SpaceCard({super.key, this.SpaceName, this.title, this.documentation, this.download, this.date, this.creator});
  final String? SpaceName; final String? title; final String? documentation; final String? download; final String? date; final String? creator;
  @override
  State<SpaceCard> createState() => _SpaceCardState();
}

class _SpaceCardState extends State<SpaceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SpaceCardPadding),
      child: Container(
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
          padding: const EdgeInsets.only(top:16, left: 26, right: 26, bottom: 16 ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.SpaceName} - ${widget.title}', style: SpaceNameStyle,),
                      Text("by ${widget.creator} on ${widget.date}", style: CreatorNameStyle,),
                    ],
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ComfyDetailPage(SpaceName: widget.SpaceName, title: widget.title))
                        );
                        },
                      icon: Icon(Icons.arrow_forward)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Text('${widget.documentation}', style: DocumentStyle,),
                  Image.network('$SupabaseSpaceFileStoragePath/${widget.SpaceName}-${widget.title}/${widget.SpaceName}-${widget.title}.gif', width: 80,),
                  Column(
                    children: [
                      DownloadButton(),
                      Gap(36),
                      DownloadCount(download: widget.download),
                    ],
                  )
                ],
              ),


            ],
          ),
        ),
      )
    );
  }
}

double CardAspectRatio(BuildContext context){
  if (MediaQuery.of(context).size.width>270){
    return 2;
  }
  else{
    return 1.1*MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height );
  }
}