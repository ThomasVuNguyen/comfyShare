import 'package:comfyshare/widgets/AddNewSpace.dart';
import 'package:comfyshare/widgets/AppBar.dart';
import 'package:flutter/material.dart';

import 'widgets/Logo.dart';
import 'widgets/SpaceCard.dart';
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
        appBar: ComfyShareAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: FutureBuilder(
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
                        crossAxisCount: NumberOfCardsPerRow(context),
                        childAspectRatio: CardAspectRatio(context),
                      ),);
                    }
                    else {
                      return Text("Loading", );
                    }
                  },
                ),
              )
            ],

          ),
        )
    );
  }
}

int NumberOfCardsPerRow(BuildContext context){
  return (MediaQuery.of(context).size.width/540).round();
}

