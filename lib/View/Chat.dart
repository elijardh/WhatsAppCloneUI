import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.asset("www"),
        ),
        title: Text("Hello"),
        actions: <Widget>[
          Icon(Icons.videocam),
          SizedBox(width: 10,),
          Icon(Icons.phone),
          SizedBox(width: 10,),
          Icon(Icons.more_vert)
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
            color: Colors.black.withOpacity(0.1),
            child: Row(

              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.insert_emoticon),
                        Container(
                          width: 250,
                          child: TextField(),
                        ),
                        Icon(Icons.refresh),
                        Icon(Icons.camera_alt)
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.greenAccent),
                  child: Icon(Icons.mic),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
