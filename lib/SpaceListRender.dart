import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpaceList extends StatefulWidget {
  const SpaceList({super.key});

  @override
  State<SpaceList> createState() => _SpaceListState();
}

class _SpaceListState extends State<SpaceList> {
  final _future = Supabase.instance.client
      .from('test')
      .select<List<Map<String, dynamic>>>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(future: _future,
      builder: (context, snapshot){
      if(!snapshot.hasData){
        return const Center(child: CircularProgressIndicator(),);
      }
      final SpaceList = snapshot.data!;
      return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: SpaceList.length,
            itemBuilder: ((context, index){
              return ListTile(
                title: Text(SpaceList[index]['name'].toString()),
              );
            })),
      );
      }
    );
  }
}
