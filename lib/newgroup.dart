import 'package:flutter/material.dart';
import 'chatsdata.dart';
import 'contactsdata.dart';

class newgroup extends StatefulWidget {
  @override
  State<newgroup> createState() => _newgroupState();
}

class _newgroupState extends State<newgroup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sortorder();
  }

  //String name = "";
  List<chatsdata> gdata = [];
  final ScrollController _controllerOne = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("New Group"),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: gdata.length > 0
                    ? Text('${gdata.length} of ${savecontact.length} selected',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400))
                    : Text(
                        "Add participants",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF128C7E),
            onPressed: () {},
            child: Icon(Icons.arrow_forward)),
        body: Stack(children: [

          RawScrollbar(
            thickness: 5,
            thumbColor: Colors.black26,
            trackVisibility: true,
            controller: _controllerOne,
            child: ListView.builder(
                controller: _controllerOne,
                itemCount: savecontact.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: gdata.length > 0 ? 70 : 0,
                      color: Colors.blue,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        setState(() {
                          if (savecontact[index - 1].select == true) {
                            gdata.remove(savecontact[index - 1]);
                            savecontact[index - 1].select = false;
                            print('after remove ${gdata.length}');
                          } else {
                            gdata.add(savecontact[index - 1]);
                            savecontact[index - 1].select = true;
                            print('after add ${gdata.length}');
                          }
                        });
                        //print('${gdata[index-1].name} ${index-1}');
                      },
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundImage: AssetImage(
                                        savecontact[index - 1].avatar ??
                                            'images/no_image.jpg'),
                                    backgroundColor: Colors.blueGrey[200],
                                  ),
                                  savecontact[index - 1].select
                                      ? Positioned(
                                          bottom: 4,
                                          right: 4,
                                          child: CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Colors.teal,
                                              child: Icon(Icons.check,
                                                  color: Colors.white, size: 16)),
                                        )
                                      : Container()
                                ],
                              )),
                        ),
                        title: Text(savecontact[index - 1].name),
                        subtitle: Text(savecontact[index - 1].message),
                      ));
                }),
          ),
          gdata.length > 0
              ? Column(
                  children: [
                    Container(
                        height: 72,
                        color: Colors.white,
                        child: ListView.builder(
                            itemCount: savecontact.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (savecontact[index].select == true) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      gdata.remove(savecontact[index]);
                                      savecontact[index].select = false;
                                      print('after remove ${gdata.length}');
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:5.0,bottom: 5.0,left: 10.0,right: 6.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 21,
                                              backgroundImage: AssetImage(
                                                  savecontact[index].avatar ??
                                                      'images/no_image.jpg'),
                                              backgroundColor:
                                                  Colors.blueGrey[200],
                                            ),
                                            Positioned(
                                              bottom: 1,
                                              right: 1,
                                              child: CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor:
                                                      Colors.blueGrey[200],
                                                  child: Icon(Icons.clear,
                                                      color: Colors.white,
                                                      size: 12)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          savecontact[index].name,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            })),
                    Divider(thickness: 1),

                  ],
                )
              : Container()
        ]));
  }
}
