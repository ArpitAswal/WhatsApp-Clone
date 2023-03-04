import 'package:flutter/material.dart';
import 'package:whatsapp_ui/newcommunity.dart';

class communityscreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Image.asset('images/bg.png',height: 120,width: 120,),
          SizedBox(height: 30,),
          Text('Introducing Communities',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 0.5)),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text('Easily organise your related groups and send announcemnets. Now,your communities,like neighbourhoods or schools, can have their own ',
            style: TextStyle(color:Colors.grey[600],fontSize: 16),),
          ),
          SizedBox(width: 15,),
          Text(' space ', style: TextStyle(color:Colors.grey[600],fontSize: 16),),
          SizedBox(height: 30,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>newcommunity()));
            },
            child: Container(
              decoration: BoxDecoration(
                color:Color(0xFF075E54),
                 borderRadius: BorderRadius.all(
                   Radius.circular(18)
              ),
              ),
            height: 35,
            width: 280,
            child:Center(
              child:Text('Start your community',style:TextStyle(color:Colors.white,fontSize: 17,fontWeight: FontWeight.w500)),
            )
      ),
          ),
        ],
      ),
    );
  }

}