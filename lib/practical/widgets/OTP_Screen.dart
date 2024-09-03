import 'dart:developer';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'Details_pages.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationid;

  OtpScreen(
      {super.key, required this.verificationid, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";
  late Timer _timer;
  int _start = 60; // Assuming OTP expires in 60 seconds
  late String currentVerificationId; // New state variable for verification ID

  @override
  void initState() {
    super.initState();
    currentVerificationId =
        widget.verificationid; // Initialize with the passed verification ID
    startTimer();
  }

  void startTimer() {
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void resendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        log('Error: ${e.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to resend OTP: ${e.message}'),
          ),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          currentVerificationId = verificationId;
          startTimer();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP has been resent'),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              "Verify with OTP Sent to",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 35,
            ),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.box,
              onChanged: (pin) {
                otp = pin;
              },
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: currentVerificationId,
                      // Use the state variable
                      smsCode: otp);
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithCredential(credential);
                  if (userCredential.user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailsPages()),
                    );
                  }
                } catch (ex) {
                  log('Error: $ex');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to sign in: ${ex.toString()}'),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                fixedSize: MaterialStateProperty.all(const Size(400, 45)),
              ),
              child: const Text(
                "Verify OTP",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              "Didn't receive it? Please retry in $_start seconds",
              style: TextStyle(color: _start == 0 ? Colors.red : Colors.black),
            ),
            TextButton(
              onPressed: _start == 0 ? resendOtp : null,
              child: const Text("Resend OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
