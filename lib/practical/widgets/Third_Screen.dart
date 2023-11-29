import 'package:flutter/material.dart';

class Third_Screen extends StatefulWidget {
  const Third_Screen({super.key});

  @override
  State<Third_Screen> createState() => _Third_ScreenState();
}

class _Third_ScreenState extends State<Third_Screen> {
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
        margin: const EdgeInsets.only(left: 25, top: 25),
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
            onTap: () {},
            cursorColor: Colors.black54,
            style: const TextStyle(fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Mobile Number",
              labelStyle: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              hintText: 'Enter your phone number',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.deepOrangeAccent),
              ),
              hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            ),
          ),
        ]),
      ),
    );
  }
}
