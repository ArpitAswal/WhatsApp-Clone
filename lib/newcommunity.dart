import 'package:flutter/material.dart';

class  newcommunity extends StatelessWidget{

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color:Colors.white)),
        title:Text('New community',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.white),),
        //centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF075E54),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size:23
          ),
          onPressed: () {
          }),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 125),
            height:100,
            width:130,
            //color: Colors.orangeAccent,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height:90,
                    width: 100,
                    decoration:BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ) ,
                  ),
                ),
                Center(child: Icon(Icons.groups,color:Colors.white,size: 76,)),
                Positioned(
                  bottom: 1,
                  right: 4.5,
                  child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.camera_alt,
                          color: Colors.white, size: 15)),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black54,
                      width: 1.5,
                    ))),
            width: MediaQuery.of(context).size.width /1.1,
            child: TextFormField(
              cursorColor: Colors.teal,
              showCursor: true,
              controller: _controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  labelText: 'Community name',
                  labelStyle: TextStyle(color: Colors.black54)),
            ),
          ),
          SizedBox(height:15),
          Container(
            height:120,
             width: MediaQuery.of(context).size.width /1.1,
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black54,
                      width: 1.5,
                    ))),
            child: TextFormField(
              cursorColor: Colors.teal,
              showCursor: true,
              controller: _controller,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  labelText: 'Community description',
              labelStyle: TextStyle(color: Colors.black54)
              ),

            ),
          )
        ],
      ),
    );
  }

}