import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chatsdata.dart';
import 'package:whatsapp_ui/messages.dart';
import 'package:flutter/foundation.dart' as foundation;
class message_screen extends StatefulWidget {
  late int i;
  message_screen(int index) {
    i = index;
  }

  @override
  State<message_screen> createState() => _message_screenState(i);
}

class _message_screenState extends State<message_screen> {
  late int ind;

  _message_screenState(int i) {
    ind = i;
  }

  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  bool fileshow = false;
  FocusNode focus = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focus.addListener(() {
      if (focus.hasFocus) {
        setState(() {
          emojiShowing = false;
          fileshow = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        appBar: AppBar(
          backgroundColor: Color(0xFF128C7E),
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                      data[ind].avatar ?? 'images/no_image.jpg'),
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[ind].name,
                    style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "last seen today at 12:05",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (buildContextcontext) {
                  return [
                    PopupMenuItem(
                        child: Text("View Contact"), value: "View Contact"),
                    PopupMenuItem(child: Text("Media,links and docs"),
                        value: "Media,links and docs"),
                    PopupMenuItem(child: Text("Search"), value: "Search"),
                    PopupMenuItem(child: Text("Mute notifications"),
                        value: "Mute notifications"),
                    PopupMenuItem(child: Text("Disappearing messages"),
                        value: "Disappearing messages"),
                    PopupMenuItem(child: Text("Wallpaper"), value: "Wallpaper"),
                    PopupMenuItem(
                      onTap: () {
                        PopupMenuItem(
                            child: Text("View Contact"), value: "View Contact");
                        print("menuitem");
                      },
                      child: Row(
                          children: [
                            Text("More"),
                            SizedBox(width: MediaQuery
                                .of(context)
                                .size
                                .width / 3.75),
                            Icon(Icons.arrow_right, color: Colors.black54,
                              size: 26,)
                          ]
                      ),)
                  ];
                }),
          ],
        ),
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: WillPopScope(
            onWillPop: () {
              if (emojiShowing) {
                setState(() {
                  emojiShowing = false;
                });
              }
              else if (fileshow) {
                setState(() {
                  fileshow = false;
                });
              }
              else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
            child: Column(
              children: [
                Expanded(child: messages()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            //color: Colors.lightGreenAccent,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 55,
                              height: 50,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 3, bottom: 6, top: 3, right: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextFormField(
                                  focusNode: focus,
                                  showCursor: true,

                                  cursorColor: Color(0xFF128C7E),
                                  cursorWidth: 1.5,
                                  keyboardType: TextInputType.multiline,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Message",
                                    hintStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: IconButton(
                                        color: Color(0xFF128C7E),
                                        icon: Icon(Icons.emoji_emotions_outlined
                                        ),
                                        onPressed: () {
                                          focus.unfocus();
                                          focus.canRequestFocus = false;
                                          setState(() {
                                            emojiShowing = !emojiShowing;
                                          });
                                        }
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          color: Color(0xFF128C7E),
                                          icon: Icon(Icons.attach_file),
                                          onPressed: () {
                                            focus.unfocus();
                                            focus.canRequestFocus = false;
                                            setState(() {
                                              fileshow = !fileshow;
                                            });
                                            showModalBottomSheet(

                                                backgroundColor: Colors
                                                    .transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    bottomSheet());
                                          },
                                        ),
                                        IconButton(
                                          color: Color(0xFF128C7E),
                                          icon: Icon(
                                              Icons.currency_rupee_rounded),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          color: Color(0xFF128C7E),
                                          icon: Icon(Icons.camera_alt),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),

                                    contentPadding: EdgeInsets.all(2),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 3, bottom: 6, top: 3, right: 1),
                            child: CircleAvatar(
                                backgroundColor: Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                        Icons.mic, color: Colors.white))),
                          ),
                        ],
                      ),
                      Offstage(
                        offstage: !emojiShowing,
                        child: SizedBox(
                            height: 250,
                            child: EmojiPicker(
                              textEditingController: _controller,
                              config: Config(
                                columns: 7,
                                // Issue: https://github.com/flutter/flutter/issues/28894
                                emojiSizeMax: 32 *
                                    (foundation.defaultTargetPlatform ==
                                        TargetPlatform.android
                                        ? 1.30
                                        : 1.0),
                                verticalSpacing: 0,
                                horizontalSpacing: 0,
                                gridPadding: EdgeInsets.zero,
                                initCategory: Category.RECENT,
                                bgColor: const Color(0xFFF2F2F2),
                                indicatorColor: Colors.blue,
                                iconColor: Colors.grey,
                                iconColorSelected: Colors.blue,
                                backspaceColor: Colors.blue,
                                skinToneDialogBgColor: Colors.white,
                                skinToneIndicatorColor: Colors.grey,
                                enableSkinTones: true,
                                showRecentsTab: true,
                                recentsLimit: 28,
                                replaceEmojiOnLimitExceed: false,
                                noRecents: const Text(
                                  'No Recents',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black26),
                                  textAlign: TextAlign.center,
                                ),
                                loadingIndicator: const SizedBox.shrink(),
                                tabIndicatorAnimDuration: kTabScrollDuration,
                                categoryIcons: const CategoryIcons(),
                                buttonMode: ButtonMode.MATERIAL,
                                checkPlatformCompatibility: true,
                              ),
                            )),
                      ),
                    ],
                  ),

                )
              ],
            ),
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
      height: 280,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreation(
                        Icons.insert_drive_file, Colors.indigo, "Document"),
                    SizedBox(
                      width: 40,
                    ),
                    iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                    SizedBox(
                      width: 40,
                    ),
                    iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreation(Icons.headset, Colors.orange, "Audio"),
                    SizedBox(
                      width: 45,
                    ),
                    iconCreation(Icons.location_pin, Colors.green, "Location"),
                    SizedBox(
                      width: 40,
                    ),
                    iconCreation(
                        Icons.currency_rupee_rounded, Colors.teal, "Payment"),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 62,vertical: 5),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    iconCreation(Icons.person, Colors.blue, "Contact"),
                    SizedBox(
                      width: 45,
                    ),
                    iconCreation(Icons.poll, Colors.teal, "Poll"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 21,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}