import 'package:whatsapp_ui/chatsdata.dart';

List<chatsdata> savecontact=List.from(data); //..addAll(data);

List<chatsdata> extracontact=[
  chatsdata(
      name: 'Hashirama',
      message: 'Hye',
    date: "2023-02-20",
      //avatar: null
    select: false,
       ),
  chatsdata(
      name: 'Eren Yeager',
      message: 'Hye',
    date: "2023-02-20",
     // avatar: null
    select: false,
  ),
  chatsdata(
      name: 'Son Goku',
      message: 'Hye',
    date: "2023-02-20",
     // avatar: null
    select: false,
  ),

  chatsdata(
    name: "Kakashi",
    message: "Hey",
    date: "2023-02-20",
    //avatar: "images/kakashi.jpg",
    select: false,
  ),
];

var allcontact=new List.from(savecontact).addAll(extracontact);

void sortorder(){
savecontact.sort((a,b)=>(a.name.compareTo(b.name)));
for(int i=0;i<savecontact.length;i++) {
savecontact[i].message = 'Hye I am ${savecontact[i].name}';
extracontact.sort((a, b) => a.name.compareTo(b.name));
}
}