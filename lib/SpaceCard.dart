import 'package:comfyshare/UniversalVariables.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                  IconButton(onPressed: (){print("open stuff");}, icon: Icon(Icons.arrow_forward)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${widget.documentation}', style: DocumentStyle,),
                  Column(
                    children: [
                      Container(
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
                      ),
                      Gap(36),
                      Text('Downloads: ${widget.download}',style: DownloadCountStyle,),
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
