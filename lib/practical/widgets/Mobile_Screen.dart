import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'OTP_Screen.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({super.key});

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }
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
        padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: Column(children: [
          const Text(
            "Enter Your Mobile Number To Get Otp",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            onTap: () {},
            cursorColor: Colors.black54,
            style: const TextStyle(fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              prefix: const Text("+91   |     ",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              border: InputBorder.none,
              labelText: "Mobile Number",
              labelStyle: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.deepOrangeAccent),
              ),
              hintText: 'Enter your phone number',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.deepOrangeAccent),
              ),
              hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {
              print("phoneController.text ${phoneController.text}");
              await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationid, int? resendtoken) {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpScreen(verificationid: verificationid, phoneNumber: "+91${phoneController.text.toString()}",)));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                  phoneNumber: "+91${phoneController.text.toString()}");
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                fixedSize: MaterialStateProperty.all(const Size(400, 45))),
            child: const Text("Get OTP",
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
              "By clicking.I accept the terms of service and privacy policy")
        ]),
      ),
    );
  }
}
