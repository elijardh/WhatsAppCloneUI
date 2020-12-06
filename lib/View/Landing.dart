import 'package:flutter/material.dart';
import 'package:whatsappui/View/Home.dart';
import 'package:whatsappui/View/Status.dart';
import 'package:whatsappui/View/Calls.dart';
import 'package:whatsappui/View/Camera.dart';
import 'package:whatsappui/Controller/services.dart';
import 'package:whatsappui/Model/ListChatModel.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState(){
    super.initState();
    _tabController =TabController(length: 4, vsync: this, initialIndex: 1);
    _scrollController = ScrollController();
  }

  @override
  void dispose(){
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

/*    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: SafeArea(
        child: Scaffold(
          //backgroundColor: Color.fromRGBO(0, 102, 75,1.0),
          body: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),

            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Color.fromRGBO(0, 102, 75,1.0),
                snap: false,
                pinned: false,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: EdgeInsets.only(bottom: 20, left: 20),
                    title: Text(
                      "WhatsApp Clone",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,),
                    )),
                expandedHeight: 50,
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: null),
                  PopupMenuButton<popUpMenu>(
                    icon: Icon(Icons.more_vert, color: Colors.white,),
                    onSelected: (popUpMenu result){
                      if(result == popUpMenu.newGroup){
                        print(result.toString());
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<popUpMenu>>[
                      const PopupMenuItem(child: Text("New group"), value: popUpMenu.newGroup,),
                      const PopupMenuItem(child: Text("New broadcast"), value: popUpMenu.newBroadCast,),
                      const PopupMenuItem(child: Text("WhatsApp Web"), value: popUpMenu.whatsAppWeb,),
                      const PopupMenuItem(child: Text("Starred messages"), value: popUpMenu.starredMessages,),
                      const PopupMenuItem(child: Text("Settings"), value: popUpMenu.settings,),
                    ],
                  )
                ],
              ),
              SliverPersistentHeader(delegate: StickyTabDelegate(50, 50), pinned: true,),
              SliverFillRemaining(
                hasScrollBody: true,
                child: TabBarView(
                    children: [Camera(), Home(), Status(), Calls()]),
              ),
            ],
          ),
        ),
      ),
    );*/
  return SafeArea(
    child: Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color.fromRGBO(0, 102, 75,1.0),
              snap: false,
              forceElevated: boxIsScrolled,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(bottom: 20, left: 20),
                  title: Text(
                    "WhatsApp Clone",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,),
                  )),
              expandedHeight: 50,
              actions: <Widget>[
                IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: null),
                PopupMenuButton<popUpMenu>(
                  icon: Icon(Icons.more_vert, color: Colors.white,),
                  onSelected: (popUpMenu result){
                    if(result == popUpMenu.newGroup){
                      print(result.toString());
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<popUpMenu>>[
                    const PopupMenuItem(child: Text("New group"), value: popUpMenu.newGroup,),
                    const PopupMenuItem(child: Text("New broadcast"), value: popUpMenu.newBroadCast,),
                    const PopupMenuItem(child: Text("WhatsApp Web"), value: popUpMenu.whatsAppWeb,),
                    const PopupMenuItem(child: Text("Starred messages"), value: popUpMenu.starredMessages,),
                    const PopupMenuItem(child: Text("Settings"), value: popUpMenu.settings,),
                  ],
                )
              ],
            ),
            SliverPersistentHeader(delegate: StickyTabDelegate(50, 50, _tabController), pinned: true,),
          ];
        },
        body: TabBarView(children: [Camera(), Home(), Status(), Calls()], controller: _tabController,)
      ),
      floatingActionButton: FloatingActionButton(onPressed: null, child: _tabController.index == 1 ? Icon(Icons.message) : Icon(Icons.add_circle_outline),),
    ),
  );
  }
}
