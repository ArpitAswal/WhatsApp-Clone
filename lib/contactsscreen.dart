import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chatsdata.dart';

import 'contactsdata.dart';
import 'message_screen.dart';
import 'newgroup.dart';

class contactsscreen extends StatefulWidget{
  @override
  State<contactsscreen> createState() => _contactsscreenState();

}

class _contactsscreenState extends State<contactsscreen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sortorder();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      titleSpacing: 0,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text("Select contact"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text("15 contacts",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),),
          )
        ],
      ),
        actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
    PopupMenuButton(
    onSelected: (value){
    print(value);
    },
    itemBuilder: (buildContextcontext){

    return[
    PopupMenuItem(child: Text("Invite a friend"),value:"Invite a friend"),
    PopupMenuItem(child: Text("Conatcs"),value:"Contacts"),
    PopupMenuItem(child: Text("Refresh"),value:"Refresh"),
    PopupMenuItem(child: Text("Help"),value:"Help"),
    ];
    }),
  ],
    ),
    body: Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 5,

      child:SingleChildScrollView(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => newgroup()));
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Icon(Icons.group),
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
            ),
            title: Text('New group',style: TextStyle(fontWeight: FontWeight.w600),),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: Icon(Icons.person_add),
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
            ),
            title: Text('New contact',style: TextStyle(fontWeight: FontWeight.w600),),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: Icon(Icons.groups),
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
            ),
            title: Text('New community',style: TextStyle(fontWeight: FontWeight.w600),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:12.0,top:10.0),
            child: Text('Contacts on Whatsapp',style: TextStyle(fontSize: 16,color: Colors.blueGrey.shade700,fontWeight: FontWeight.w500),),
          ),
          SizedBox(height:8),
          for(int i=0;i<data.length;i++)
            ListTile(
              title:  InkWell(
                  child: Text(savecontact[i].name),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>message_screen(i)));
                },),
              leading: CircleAvatar(
                 backgroundImage: AssetImage(savecontact[i].avatar ?? 'images/no_image.jpg'),
                 radius:20,
               ),
               subtitle:Text(savecontact[i].message),
             ),
          Padding(
            padding: const EdgeInsets.only(left:12.0,top:10.0),
            child: Text('Invite to Whatsapp',style: TextStyle(fontSize: 16,color: Colors.blueGrey.shade700,fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 8,),
          for(int i=0;i<extracontact.length;i++)
             ListTile(
               leading: CircleAvatar(
                 radius:20,
                 backgroundImage: AssetImage(extracontact[i].avatar ?? 'images/no_image.jpg'),
               ),
               title:  InkWell(
                 child: Text(extracontact[i].name),
                 onTap: (){
                   //Navigator.push(context,MaterialPageRoute(builder: (context)=>message_screen(i)));
                 },),
               trailing: Padding(
                 padding: const EdgeInsets.only(right:10.0),
                 child: Text('Invite',style: TextStyle(color: Colors.teal.shade700,fontSize: 15),),
               ),
             ),
          ListTile(
            leading:CircleAvatar(
            child:Icon(Icons.share),
              foregroundColor: Colors.black45,
              backgroundColor: Colors.black26,
          ),
           title: Text('Share invite link',style: TextStyle(fontWeight: FontWeight.bold),),
            //iconColor: Colors.black54
         ),
          ListTile(
              leading:CircleAvatar(
            child:Icon(Icons.question_mark),
                foregroundColor: Colors.black45,
            backgroundColor: Colors.black26,
    ),
    title: Text('Contacts help',style: TextStyle(fontWeight: FontWeight.bold),),
      //        iconColor: Colors.black54
          )
        ],
      ),),
    ),
    );
  }
}