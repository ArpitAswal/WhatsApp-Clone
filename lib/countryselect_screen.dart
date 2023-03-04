import 'package:flutter/material.dart';

import 'countrydata.dart';
class countryselect_screen extends StatefulWidget{
  
  @override
  State<countryselect_screen> createState() => _countryselect_screenState();

}
class _countryselect_screenState extends State<countryselect_screen> {
  List<countrydata> country = [
    countrydata(name: "India", code: "+91", flag: "🇮🇳"),
    countrydata(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    countrydata(name: "United States", code: "+1", flag: "🇺🇸"),
    countrydata(name: "South Africa", code: "+27", flag: "🇿🇦"),
    countrydata(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    countrydata(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    countrydata(name: "Italy", code: "+39", flag: "🇮🇹"),
    countrydata(name: "India", code: "+91", flag: "🇮🇳"),
    countrydata(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    countrydata(name: "United States", code: "+1", flag: "🇺🇸"),
    countrydata(name: "South Africa", code: "+27", flag: "🇿🇦"),
    countrydata(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    countrydata(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    countrydata(name: "Italy", code: "+39", flag: "🇮🇹"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
centerTitle: true,
        elevation: 0,
        title: Text('Choose a Country',style: TextStyle(color: Colors.teal,
          fontSize: 18,
          wordSpacing: 1,
          fontWeight: FontWeight.w600)),
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back,color:Colors.grey),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,color:Colors.grey))
      ],),
      body: ListView.builder(
          itemCount: country.length,
          itemBuilder: (context,index)=>card(country[index])),
    );
  }

Widget card(countrydata c){
    return InkWell(
      onTap: (){
        Navigator.pop(context,c);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child:Container(
          height:60,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Row(
            children: [
              Text(c.flag),
              SizedBox(width: 20,),
              Text(c.name),
              Expanded(
                child: Container(
                  width: 150,
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(c.code),
                      ],
                    )),
              ),

            ],
          ),
        ),
      ),
    );
}

}