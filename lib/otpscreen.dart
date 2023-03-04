import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:whatsapp_ui/verificationscreen.dart';

import 'main.dart';

class otpscreen extends StatelessWidget {
  var phone;
  var code;
  otpscreen(this.phone, this.code);


  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => verificationscreen()));
          },
          color: Colors.black54,
        ),
        title: Text('Verify ${code} ${phone}',
            style: TextStyle(color: Colors.teal, fontSize: 16)),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                print(value);
              },
              color: Colors.grey,
              itemBuilder: (buildContextcontext) {
                return [
                  PopupMenuItem(child: Text("Help"), value: "Help"),
                ];
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cleaning_services),
        onPressed: () {
          print("Floating button was pressed.");
          otpController.clear();
        },
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'Waiting to automatically detect an SMS sent to ',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${code} ${phone}.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => verificationscreen()));
                    },
                    child: Text(
                      ' Wrong number?',
                      style: TextStyle(fontSize: 16, color: Colors.cyan[800]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 28,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage(title: 'WhatsApp'),
                        ));
                  }),
              SizedBox(
                height: 20,
              ),
              Text('Enter 6-digit code',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.teal,
                    size: 24,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Resend SMS',
                    style: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.teal,
                    size: 24,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Call Me',
                    style: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  String otpcode(){
    return code;
  }
}

