import 'package:flutter/material.dart';
import 'package:whatsapp_ui/calldata.dart';

class callsscreen extends StatefulWidget {
  @override
  State<callsscreen> createState() => _callsscreenState();
}

class _callsscreenState extends State<callsscreen> {
  @override
  void initState(){
    super.initState();

    sortcalldate();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 75,
           // color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: CircleAvatar(
                radius:23,
                backgroundColor:Colors.teal,
                child: Icon(
                  Icons.link,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(
                'Create call link',
                style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Share a link for your WhatsApp call',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
          ),

          Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text('Recent ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
              )),
         for(int i=0;i<Data.length;i++)
            callstatus(Data[i].avatar,Data[i].name,Data[i].callType,Data[i].time),

          Divider(),

          Container(
            height: 190,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, color: Colors.black54, size: 14),
                RichText(
                    //textAlign: TextAlign.center,
                    text: TextSpan(
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                        text: "Your personal calls are ",
                        style: TextStyle(color: Colors.grey[600])),
                    TextSpan(
                        text: "end-to-end enrypted",
                        style: TextStyle(color: Colors.teal))
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget callstatus(String? image, String name, Icon call,String time) {
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
      Row(
        children: [
          Container(
            child: call,
          ),
          Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 15.0,fontWeight: FontWeight.w500),
          ),
        ],
      ),
      trailing: Icon(Icons.call,color:Colors.teal),
    );
  }
}
