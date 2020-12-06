import 'package:flutter/material.dart';
import 'package:whatsappui/Controller/services.dart';
import 'package:whatsappui/Model/ListChatModel.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var ah = new ChatList();
  Future<List<ListChatModel>> curList() async{
    var hehe = ah.getList();
    return hehe;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<ListChatModel>>(
            future: curList(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                  ListChatModel chatModel = snapshot.data[index];
                  return chatDesign(chatModel.image, chatModel.contactName, chatModel.lastMessage, chatModel.dateTime, chatModel.numberOfMessage);
                },);
              }
              if(snapshot.hasError){
                return Container(
                  child: Text("$snapshot.error"),
                );
              }
              if(!snapshot.hasData){
                return Container(
                  child: Text("WATAFAK"),
                );
              }
              else{
                return Container();
              }
        }),
      );
  }

  Widget chatDesign(String img, String name, String lastMessage, DateTime dateTime, int noOfMessages){
    String timeOfDay(DateTime time){
      var tim = TimeOfDay.fromDateTime(time);
      return tim.period.toString().split(".")[1].toUpperCase();
    }
    String _getTime(DateTime time){
      return DateFormat("kk:mm").format(time).toString();
    }
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  showDialog(context: context,builder:(BuildContext context){
                    return Dialog(
                      child: Container(
                        height: 400,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Center(/*child: Icon(Icons.account_circle,size: 200,)*/
                                  child: Image.asset(img, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                      child: Text(name, style: TextStyle(fontSize: 20, color: Colors.white),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(child: Icon(Icons.message)),
                                  Expanded(child: Icon(Icons.info_outline))
                                ],
                              ),
                              color: Colors.greenAccent,
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
                child: Container(
                  child: Icon(Icons.account_circle, size: 60,),
                ),
              ),
              Expanded(child: Container(
                padding: EdgeInsets.only(left:10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Text(lastMessage)
                  ],
                ),
              ),),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("${_getTime(dateTime)}"+"${timeOfDay(dateTime)}"),
                  SizedBox(height: 10,),
                  Container(
                    height: 20,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(/*shape: BoxShape.circle,*/ color: Colors.green, borderRadius: BorderRadius.circular(15.0)),
                    child: Center(child: Text(noOfMessages.toString(), style: TextStyle(fontSize: 12, color: Colors.white),)),
                  )
                ],
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
