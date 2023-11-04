import 'package:comfyshare/AddNewSpace.dart';
import 'package:flutter/material.dart';

import 'Logo.dart';
import 'SpaceCard.dart';
import 'dababase_function.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const ComfyLogo(),
          actionsIconTheme: IconThemeData(
            size: 46.0,
          ),
          actions:[
            const AddNewSpaceWidget(),
          ]
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: SpaceListRender(),
                builder: (BuildContext context, AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
                  if(snapshot.hasData){
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index){
                        String? SpaceName = snapshot.data?[index]['Space Name'].toString();
                        String? title = snapshot.data?[index]['Title'].toString();
                        String? documentation = snapshot.data?[index]['Documentation'].toString();
                        String? date = snapshot.data?[index]['date'].toString();
                        String? creator = snapshot.data?[index]['Creator'].toString();
                        String? download = snapshot.data?[index]['Download'].toString();
                        return SpaceCard(SpaceName: SpaceName, creator: creator, date: date, documentation: documentation, download: download,title: title,);
                      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1*MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height ),
                    ),);
                  }
                  else {
                    return Text("Loading", );
                  }
                },
              )
            ],

          ),
        )
    );
  }
}
