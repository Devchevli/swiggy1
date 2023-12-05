import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'Confirm_Details_Pages.dart';

class OTP_Screen extends StatefulWidget {
  const OTP_Screen({super.key});

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        // margin: const EdgeInsets.only(left: 25, top: 25, right: 25),
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(children: [
          const Text(
            "Verify with OTP Sent to",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 35,
          ),
          OTPTextField(
            length: 5,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 50,
            style: const TextStyle(color: Colors.blueGrey, fontSize: 17),

            textFieldAlignment: MainAxisAlignment.spaceEvenly,
            fieldStyle: FieldStyle.box,
            // onCompleted: (pin) {
            //   print("Completed: " + pin);
            // },
          ), const SizedBox(
            height: 35,
          ),
          ElevatedButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const Confirm_Details_Pages() ));},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                fixedSize: MaterialStateProperty.all(const Size(400, 45))),
            child: const Text("Get OTP", style: TextStyle(fontSize: 17)),
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
              "Didn't receive it..?? please retry")
        ]),
      ),
    );
  }
}
