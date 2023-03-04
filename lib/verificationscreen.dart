import 'package:flutter/material.dart';
import 'package:whatsapp_ui/countryselect_screen.dart';
import 'package:whatsapp_ui/otpscreen.dart';

import 'countrydata.dart';


class verificationscreen extends StatefulWidget {

  @override
  State<verificationscreen> createState() => _verificationscreenState();
}

class _verificationscreenState extends State<verificationscreen> {
  String countryname = "choose a country";
  static String countrycode = "";


  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Enter your Phone number",
            style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
                wordSpacing: 1,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  print(value);
                },
                color: Colors.grey,
                itemBuilder: (buildContextcontext) {
                  return [
                    PopupMenuItem(
                        child: Text("Link a device"), value: "Link a device"),
                    PopupMenuItem(child: Text("Help"), value: "Help"),
                  ];
                })
          ],
        ),
        body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'WhatAapp will need to verify your phone number. ',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "What's my number?",
                  style: TextStyle(fontSize: 14, color: Colors.cyan),
                ),
                SizedBox(
                  height: 15,
                ),
                countrycard(),
                SizedBox(height: 5),
                number(),
                SizedBox(
                  height: 12,
                ),
                Center(
                    child: Text('Carrier charges may apply',
                        style: TextStyle(color: Colors.black54))),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    if (_controller.text.length < 10)
                      showdialog2();
                    else if (_controller.text.length > 10)
                      showdialog3();
                    else
                      showdialog();
                  },
                  child: Container(
                      color: Colors.teal[900],
                      height: 38,
                      width: 72,
                      child: Center(
                        child: Text('Next',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Center(
                      child: Text('This version of WhatsApp is in Beta',
                          style: TextStyle(color: Colors.black54))),
                ),
              ],
            )));
  }

  Widget countrycard() {
    return InkWell(
      onTap: () async {
        final countrydata result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => countryselect_screen()),
        );
        setState(() {
          countryname = result.name;
          countrycode = result.code;
        });
        //Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        //height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.teal,
          width: 1.8,
        ))),
        child: Row(
          children: [
            Expanded(
                child: Container(
                    child: Center(
                        child: Text(countryname,
                            style: TextStyle(fontSize: 15))))),
            Icon(Icons.arrow_drop_down, color: Colors.teal)
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 40,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
              width: 60,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.teal,
                width: 1.8,
              ))),
              child: Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  Text("+",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54)),
                  SizedBox(
                    width: 10,
                  ),
                  if (countrycode.length > 1)
                    Text(countrycode.substring(1),
                        style: TextStyle(
                          fontSize: 15,
                        ))
                  else
                    Text(countrycode,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                ],
              )),
          SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.teal,
              width: 1.8,
            ))),
            width: MediaQuery.of(context).size.width / 1.5 - 95,
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  hintText: 'phone number'),
            ),
          )
        ]));
  }

  Future<void> showdialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('You entered the phone number',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  SizedBox(
                    height: 12,
                  ),
                  Text(countrycode + " " + _controller.text,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54)),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Is this OK, or would you like to edit the number?',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'EDIT',
                    style: TextStyle(color: Colors.teal, fontSize: 16),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => otpscreen(
                                _controller.text.toString(), countrycode)));
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.teal, fontSize: 16),
                  ))
            ],
          );
        });
  }

  Future<void> showdialog2() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              children: [
                Text(
                    'The phone number you entered is too short for the country: ${countryname}.',
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                SizedBox(
                  height: 5,
                ),
                Text("Include your area code if you haven't",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  Future<void> showdialog3() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "The phone number you entered is too long for the country:${countryname}",
                style: TextStyle(fontSize: 14, color: Colors.black54)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

}
