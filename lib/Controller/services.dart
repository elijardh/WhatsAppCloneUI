import 'package:flutter/material.dart';
import 'package:whatsappui/Model/ListChatModel.dart';
import 'dart:async';

class StickyTabDelegate extends SliverPersistentHeaderDelegate{

  final double minExtent;

  final double maxExtent;
  StickyTabDelegate(this.minExtent, this.maxExtent);

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color.fromRGBO(0, 102, 75, 1.0),
      child: TabBar(tabs: [
        Container(
          alignment: Alignment.center,
          child: Icon(Icons.camera_alt,color: Colors.white),
        ),
        Container(
          alignment: Alignment.center,
          child: Text("CHATS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        Container(
          alignment: Alignment.center,
          child: Text("STATUS",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        Container(
          alignment: Alignment.center,
          child: Text("CALLS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ]),
    );
}
}

class ChatList{
  Future<List<ListChatModel>> getList() async {
    List<ListChatModel> snapshot = [
      new ListChatModel(DateTime.now(), "image", "CowBunga", "E go Be", 2),
      new ListChatModel(DateTime.now(), "image", "Pedorico", "Bish", 1),
      new ListChatModel(DateTime.now(), "image", "Neo", "AS ma pa mi", 10000),
      new ListChatModel(DateTime.now(), "image", "Pedorico", "Bish", 1),
      new ListChatModel(DateTime.now(), "image", "Pedorico", "Bish", 1),
      new ListChatModel(DateTime.now(), "image", "Pedorico", "Bish", 1),
      new ListChatModel(DateTime.now(), "image", "Pedorico", "Bish", 1),
      new ListChatModel(DateTime.now(), "image", "Pedorico", "Bish", 1),
    ];
    return await snapshot;
}

}