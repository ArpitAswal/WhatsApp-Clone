
class chatsdata{
   String name;
   String message;
   String date;
   String ?avatar;
  bool select;
 chatsdata({required this.name,required this.message,required this.date,this.avatar,required this.select,});

}

  List<chatsdata> data = <chatsdata>[
    chatsdata(
      name: "Kakashi",
      message: "Hey",
        date: "2023-02-20",
      avatar: "images/kakashi.jpg",
      select: false
    ),
    chatsdata(
      name: "Dabi",
      message: "Hey",
        date: "2023-02-18",
      avatar: "images/dabi.jpg",
        select: false

    ),
    chatsdata(
      name: "Itachi",
      message: "Hey",
        date: "2023-02-02",
     // avatar:"images/itachi.jpg",
        select: false

    ),
    chatsdata(
      name: "Jiraiya",
      message: "Hey",
        date: "2023-02-20",
      avatar: "images/jiraiya.jpg",
        select: false

    ),
    chatsdata(
      name: "Minato",
      message: "Hey",
        date: "2023-01-25",
      avatar: "images/minato.jpg",
        select: false

    ),
    chatsdata(
      name: "Ichigo",
      message: "Hey",
        date: "2023-02-20",
      avatar: "images/ichigo.jpg",
        select: false

    ),
    chatsdata(
      name: "Obito",
      message: "Hey",
        date: "2023-02-20",
      avatar: "images/obito.jpg",
        select: false

    ),
    chatsdata(
      name: "Gara",
      message: "Hey",
        date: "2023-02-05",
      avatar: "images/gara.jpg",
        select: false

    ),
    chatsdata(
      name: "Gaba",
      message: "Hey",
        date:"2023-01-30",
      avatar: "images/gara.jpg",
        select: false

    ),
    chatsdata(
      name: "Kakashi",
      message: "Hey",
        date: "2023-01-20",
      avatar: "images/kakashi.jpg",
        select: false

    ),
    chatsdata(
      name: "Dabi",
      message: "Hey",
        date: "2023-02-20",
      avatar: "images/dabi.jpg",
        select: false

    ),
    chatsdata(
      name: "Itachi",
      message: "Hey",
        date: "2023-02-10",
      avatar: "images/itachi.jpg",
        select: false

    ),
    chatsdata(
      name: "Jiraiya",
      message: "Hey",
        date: "2022-12-20",
      avatar: "images/jiraiyatwo.jpg",
        select: false

    ),
  ];

sortdate(){
  data.sort((a,b){
    return DateTime.parse(b.date).compareTo(DateTime.parse(a.date));
  });
}