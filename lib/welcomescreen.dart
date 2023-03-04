import 'package:flutter/Material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';
import 'package:whatsapp_ui/verificationscreen.dart';

class welcomescreen extends StatelessWidget {
  //const welcomescreen({super.key});
  final supportedLanguages = [
    Languages.english,
    Languages.french,
    Languages.japanese,
    Languages.korean,
    Languages.hindi,
    Languages.german,
    Languages.arabic,
    Languages.chineseTraditional,
    Languages.greek,
    Languages.indonesian,
    Languages.italian,
    Languages.urdu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Column(
                children: [
                  // SizedBox(height:50),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10 - 30,
                  ),
                  Image.asset("images/bg.png",
                      color: Colors.greenAccent[700], height: 340, width: 340),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10 - 20,
                  ),
                  Text('Welcome to WhatsApp',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 25)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                                text: "Read our ",
                                style: TextStyle(color: Colors.grey[600])),
                            TextSpan(
                                text: "Privacy Policy. ",
                                style: TextStyle(color: Colors.blue)),
                            TextSpan(
                                text: 'Tap "Agree and continue" to accept the ',
                                style: TextStyle(color: Colors.grey[600])),
                            TextSpan(
                                text: "Terms of Service.",
                                style: TextStyle(color: Colors.blue))
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => verificationscreen()),
                          (route) => false);
                    },
                    child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 110,
                        child: Card(
                            margin: EdgeInsets.all(0),
                            elevation: 8,
                            color: Colors.green[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Text(
                              "AGREE AND CONTINUE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            )))),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  Container(
                    width: 210,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 22.0),
                          height: 50,
                          width: 14,
                          child: Icon(
                            Icons.language,
                            color: Colors.teal,
                            size: 24,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 170,
                          //color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: LanguagePickerDropdown(
                                initialValue: Languages.english,
                                languages: supportedLanguages,
                                onValuePicked: (Language language) {
                                  print(language.name);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
