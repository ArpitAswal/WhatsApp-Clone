class statusdata {
  final String name;
  final String time;
  final String? avatar;

  statusdata({required this.name, required this.time, this.avatar});
}

List<statusdata> recentstatus = [
  statusdata(
    name: "Kakashi",
    time: "Today,10:20 pm",
    avatar: "images/kakashi.jpg",
  ),
  statusdata(
    name: "Gara",
    time: "Today,14:23 pm",
    avatar: "images/gara.jpg",
  ),
  statusdata(
    name: "Dabi",
    time: "Yesterday,23:20 pm",
    avatar: "images/dabi.jpg",
  ),
  statusdata(
    name: "Jiraiya",
    time: "Yesterday,8:30 am",
    avatar: "images/jiraiya.jpg",
  ),
];

List<statusdata> viewedstatus = [
  statusdata(
    name: "Ichigo",
    time: "Today,10:20 pm",
    avatar: "images/ichigo.jpg",
  ),
  statusdata(
    name: "Itachi",
    time: "Today,14:23 pm",
    avatar: "images/itachi.jpg",
  ),
  statusdata(
    name: "Minato",
    time: "Yesterday,23:20 pm",
    avatar: "images/minato.jpg",
  ),
  statusdata(
    name: "Obito",
    time: "Yesterday,8:30 am",
    avatar: "images/obito.jpg",
  ),
];