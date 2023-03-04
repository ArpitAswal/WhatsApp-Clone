import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chatsdata.dart';
import 'package:whatsapp_ui/message_screen.dart';


class chatsscreen extends StatefulWidget{
  const chatsscreen({super.key});

  @override
  State<chatsscreen> createState() => _chatsscreenState();
}

class _chatsscreenState extends State<chatsscreen> {
  final ScrollController _controllerOne = ScrollController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    sortdate();
  }
  @override
  Widget build(BuildContext context) {
   return Container(
     child:RawScrollbar(
       thickness: 5,
       thumbColor: Colors.black26,
       trackVisibility: true,

       controller: _controllerOne,
       child: ListView.builder(
         controller: _controllerOne,
         itemCount:data.length,
         itemBuilder: (context,i)=>Column(
           //mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.only(left:40.0,right:20.0),
             ),
             ListTile(
               leading:
                 CircleAvatar(
                   radius:23,
                   backgroundColor: Colors.black54,
                   backgroundImage: AssetImage(data[i].avatar ?? 'images/no_image.jpg'),
                 ),
               title:Text(data[i].name,style:TextStyle(fontWeight: FontWeight.bold)),
               subtitle: Row(
                 children: [
                   Icon(Icons.done_all),
                   SizedBox(width: 4,),
                   Text(data[i].message,style: TextStyle(fontWeight: FontWeight.w600)),
                 ],
               ),
               trailing: Text(data[i].date,style:TextStyle(fontWeight: FontWeight.w400,fontSize: 12),
           ),
               onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>message_screen(i)));
               },
             ),
           ],
         )
       ),
     ),
   );
  }

}