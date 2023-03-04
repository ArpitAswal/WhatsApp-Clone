import 'package:flutter/material.dart';
import 'package:whatsapp_ui/callsscreen.dart';
import 'package:whatsapp_ui/chatsscreen.dart';
import 'package:whatsapp_ui/contactsscreen.dart';
import 'package:whatsapp_ui/statusscreen.dart';
import 'SplashScreen.dart';
import 'communityscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF128C7E), //teal green
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF075E54)
              //teal green dark- 0xFF075E54
              //light green- 0xFF25D366
              //blue- 0xFF34B7F1
              )),

      home: const SplashScreen(),
      // const MyHomePage(title: 'WhatsApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> toptab = <Tab>[
    Tab(icon: Icon(Icons.groups)),
    Tab(text: 'Chats'),
    Tab(text: "Status"),
    Tab(text: "Calls"),
  ];
  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('WhatsApp'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          _tabController.index != 0
              ? IconButton(onPressed: () {}, icon: Icon(Icons.search))
              : Container(),
          if(_tabController.index==1)
            PopupMenuButton(onSelected: (value) {
            print(value);
            } , itemBuilder: (buildContextcontext) {
            return [
              PopupMenuItem(child: Text("New Group"), value: "New Group"),
              PopupMenuItem(
                  child: Text("New Broadcast"), value: "New Broadcast"),
              PopupMenuItem(
                  child: Text("Linked Devices"), value: "Linked Devices"),
              PopupMenuItem(
                  child: Text("Starred Devices"), value: "Starred Devices"),
              PopupMenuItem(child: Text("Payments"), value: "Payments"),
              PopupMenuItem(child: Text("Settings"), value: "Settings"),
            ];
             })
          else if(_tabController.index==2 || _tabController.index==3)
            PopupMenuButton(onSelected: (value) {
              print(value);
            } , itemBuilder: (buildContextcontext) {
              return [
                PopupMenuItem(child: _tabController.index==2?Text("Status privacy"):Text("Clear call log"), value: _tabController.index==2?"Status privacy":"Clear call log"),
                PopupMenuItem(
                    child: Text("Settings"), value: "Settings"),

              ];
            })
          else
            PopupMenuButton(onSelected: (value) {
              print(value);
            } , itemBuilder: (buildContextcontext) {
              return [
                PopupMenuItem(child: Text("Settings"), value: "Settings"),
               ];
            })
        ],
        bottom: TabBar(
          tabs: toptab,
          indicatorColor: Colors.white,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          communityscreen(),
          chatsscreen(),
          statusscreen(),
          callsscreen(),
        ],
      ),
      floatingActionButton: _getFAB(),
    );
  }

  _getFAB() {
    if (_tabController.index == 1) {
      return FloatingActionButton(
          backgroundColor: Color(0xFF075E54),
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => contactsscreen()));
          });
    } else if (_tabController.index == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.grey,
            elevation: 9,
            child: Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffE1E8EB).withOpacity(0.35),
                    spreadRadius: 8,
                    blurRadius: 4,
                    offset: const Offset(1, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.black54,
                size: 23,
                shadows: [
                  Shadow(
                    color: Color(0xffE1E8EB),
                    offset: Offset(0.2, 0.5),
                    blurRadius: 5.0,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              backgroundColor: Color(0xFF075E54),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () => print('Open Camera')),
        ],
      );
    } else if (_tabController.index == 3) {
      return FloatingActionButton(
          backgroundColor: Color(0xFF075E54),
          child: Icon(
            Icons.add_call,
            color: Colors.white,
          ),
          onPressed: () => print('Open Call'));
    } else {
      return null;
    }
  }
}
