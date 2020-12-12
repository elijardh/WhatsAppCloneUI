import 'package:flutter/material.dart';
import 'package:whatsappui/Controller/services.dart';
import 'package:whatsappui/Model/ListChatModel.dart';
class Profile extends StatelessWidget {
  final String name;
  Profile(this.name);
  final ChatList hey = ChatList();

  Future<List<ListChatModel>> curList() async{
    var heyy = hey.getList();
    return heyy;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool isScrolled){
        return <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            snap: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(name,style: TextStyle(fontSize: 25),),
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
        ];
      },
          body: Container(
        color: Color.fromRGBO(245,245,245, 1),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Media, Links and Docs", style: TextStyle(color: Color.fromRGBO(30, 98, 64, 1.0),),),
                      SizedBox(width: 170,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: <Widget>[
                            Text("19"),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 80,
                    child: FutureBuilder<List<ListChatModel>>(
                        future: curList(),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            return ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                              return Container(
                                padding: EdgeInsets.only(right: 5),
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
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Mute Notification", style: TextStyle(fontSize: 18),),
                      SizedBox(
                        width: 180,
                      ),
                      Align(
                        alignment: Alignment.centerRight,

                        //child: Switch(value: null, onChanged: null, )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Align(child: Text("Custom Notification", style: TextStyle(fontSize: 18)),alignment: Alignment.centerLeft,),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Align(child: Text("Media Visibility", style: TextStyle(fontSize: 18)), alignment: Alignment.centerLeft,),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Align(child: Text("Encryption", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), alignment: Alignment.centerLeft,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Messages and calls are end to end encrypted. Tap to \nverify"),
                      SizedBox(width: 20,),
                      Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Icon(Icons.lock, color: Color.fromRGBO(30, 98, 64, 1.0),))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Align(child: Text("About and phone number", style: TextStyle(color: Color.fromRGBO(30, 98, 64, 1.0), fontSize: 16),), alignment: Alignment.centerLeft,),
                  SizedBox(height: 10,),
                  Align(child: Text("Hey There I am using Whatsapp", style: TextStyle(fontSize: 18),), alignment: Alignment.centerLeft,),
                  Align(child: Text("November 10", style: TextStyle(color: Colors.black45),), alignment: Alignment.centerLeft,),
                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(child: Text("+234 747 448 8904", style: TextStyle(fontSize: 18),), alignment: Alignment.centerLeft,),
                          Align(child: Text("Other", style: TextStyle(color: Colors.black45),), alignment: Alignment.centerLeft,)
                        ],
                      ),
                      SizedBox(width: 80,),
                      Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.message, color: Color.fromRGBO(30, 98, 64, 1.0),),
                            SizedBox(width: 20,),
                            Icon(Icons.call, color: Color.fromRGBO(30, 98, 64, 1.0),),
                            SizedBox(width: 20,),
                            Icon(Icons.videocam, color: Color.fromRGBO(30, 98, 64, 1.0),),
                          ],
                        ),
                      )

                    ],
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(18),
              child: Row(
                children: <Widget>[
                  Icon(Icons.do_not_disturb, color: Colors.red,),
                  SizedBox(width: 30,),
                  Text("Block", style: TextStyle(color: Colors.red, fontSize: 18),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(18),
              child: Row(
                children: <Widget>[
                  Icon(Icons.thumb_down, color: Colors.red,),
                  SizedBox(width: 30,),
                  Text("Report Contact", style: TextStyle(color: Colors.red, fontSize: 18),),
                  Divider()
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),)
    ));
  }
}
