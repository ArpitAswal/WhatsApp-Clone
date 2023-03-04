import 'package:flutter/material.dart';
import 'package:whatsapp_ui/statusdata.dart';

class statusscreen extends StatefulWidget {
  @override
  State<statusscreen> createState() => _statusscreenState();
}

class _statusscreenState extends State<statusscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListTile(
                  leading: Container(
                      height: 50,
                      width: 50,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage('images/kakashi.jpg'),
                            backgroundColor: Colors.blueGrey[200],
                          ),
                          Positioned(
                            bottom: 6,
                            right: 5,
                            child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.green,
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 15)),
                          ),
                        ],
                      )),
                  title: Text('My status',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: Text('Tap to add status here',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                )),
            Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text('Recent status',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                )),
            for (int i = 0; i < recentstatus.length; i++)
              status(recentstatus[i].avatar, recentstatus[i].name,
                  recentstatus[i].time),
            SizedBox(
              height: 5,
            ),
            Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text('Viewed status',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                )),
            for (int i = 0; i < viewedstatus.length; i++)
              status(viewedstatus[i].avatar, viewedstatus[i].name,
                  viewedstatus[i].time),

            Divider(),
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock,color:Colors.black54,size:14),
                  RichText(
                      //textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                        children:[

                          TextSpan(
                              text: "Your status updates are ",
                              style: TextStyle(color: Colors.grey[600])),
                          TextSpan(
                              text:
                              "end-to-end enrypted",
                              style: TextStyle(color: Colors.teal))
                        ],
                      )),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget status(String? image, String name, String time) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.blueGrey,
        backgroundImage: AssetImage(image ?? 'images/no_image.jpg'),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle:
          Text(time, style: TextStyle(fontSize: 13, color: Colors.black54)),
    );
  }
}
