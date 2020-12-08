import 'package:flutter/material.dart';
import 'package:whatsappui/Controller/services.dart';
import 'package:whatsappui/Model/ListChatModel.dart';
import 'package:async/async.dart';
class Profile extends StatelessWidget {
  final ChatList hey = ChatList();

  Future<List<ListChatModel>> curList() async{
    var heyy = hey.getList();
    return heyy;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            snap: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hello",style: TextStyle(fontSize: 25),),
              titlePadding: EdgeInsets.only(left: 20, bottom: 20),
              background: Image.asset("assets/pic.jpg", fit: BoxFit.cover,),
            ),
           /* flexibleSpace: Container(
              child: Image.asset("assets/pic.jpg",fit: BoxFit.cover,),
            ),*/
            actions: <Widget>[
              Icon(Icons.more_vert)
            ],
          ),
          SliverFillRemaining(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text("Media, Links and Docs"),
                  Container(
                    height: 80,
                    child: FutureBuilder<List<ListChatModel>>(
                      future: curList(),
                        builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(itemBuilder: (context, index){
                            return Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(snapshot.data[index].image, fit: BoxFit.cover,),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,);
                        }
                        else{
                          return Container();
                        }
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
