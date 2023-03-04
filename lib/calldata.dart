import 'package:flutter/material.dart';

class calldata {
  final String name;
  final String time;
  final String? avatar;
  final Icon callType;

  calldata({required this.name, required this.time, this.avatar, required this.callType});
  static Icon callReceived = Icon(
    Icons.call_received,
    size: 18,
    color: Colors.green,
  );
  static Icon callMissed = Icon(
    Icons.call_missed,
    size: 18,
    color: Colors.red,
  );
}

List<calldata> Data = [
  calldata(
    name: "Kakashi",
    time: "28 February, 9:51 pm",
    callType: calldata.callReceived,
    avatar: "images/kakashi.jpg",
  ),
  calldata(
    name: "Minato",
    time: "26 February, 8:39 pm",
    callType: calldata.callMissed,
    avatar: "images/minato.jpg",
  ),
  calldata(
    name: "Itachi",
    time: "26 February, 8:39 pm",
    callType: calldata.callReceived,
    avatar: "images/itachi.jpg",
  ),
  calldata(
    name: "Dabi",
    time: "21 February, 8:15 pm",
    callType: calldata.callMissed,
    avatar: "images/dabi.jpg",
  ),
  calldata(
    name: "Obito",
    time: "24 February, 12:12 am",
    callType: calldata.callMissed,
    avatar: "images/obito.jpg",
  ),
  calldata(
    name: "Ichigo",
    time: "06 February, 8:00 am",
    callType: calldata.callMissed,
    avatar: "images/ichigo.jpg",
  ),
];

sortcalldate(){
  Data.sort((a,b){
    return (b.time).compareTo((a.time));
  });
}