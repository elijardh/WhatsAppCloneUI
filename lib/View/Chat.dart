import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final String name;
  Chat(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(30, 98, 64, 1.0),
          leading: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            //child: Image.asset("www"),
          ),
          title: Text(name),
          actions: <Widget>[
            Icon(Icons.videocam),
            SizedBox(width: 20,),
            Icon(Icons.phone),
            SizedBox(width: 20,),
            Icon(Icons.more_vert),
            SizedBox(width: 10,)
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Container(
              color: Colors.white,
            )),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Row(

                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.insert_emoticon),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 2),
                            width: 180,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Type a messsage",
                                border: InputBorder.none
                              ),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Icon(Icons.refresh),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.camera_alt),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.greenAccent),
                    child: Icon(Icons.mic,size: 30,),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}