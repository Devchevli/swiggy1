import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant_Variable.dart';
import 'Welcome_Pages.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key});

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  String error = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(children: [
          const Text(
            "Help us get to know you",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 35),
          Column(
            children: [
              TextField(
                controller: _username,
                keyboardType: TextInputType.name,
                onTap: () {},
                cursorColor: Colors.black54,
                style: const TextStyle(fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Name",
                  labelStyle: const TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: Colors.deepOrangeAccent),
                  ),
                  hintText: 'Username',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.deepOrangeAccent),
                  ),
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Colors.black54),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                ),
              ),if(error.isNotEmpty)Text(error,style: TextStyle(color: Colors.red),),
              const SizedBox(height: 35),
              TextField(
                controller: _email,
                keyboardType: TextInputType.name,
                onTap: () {},
                cursorColor: Colors.black54,
                style: const TextStyle(fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "E-mail",
                  labelStyle: const TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: Colors.deepOrangeAccent),
                  ),
                  hintText: 'E-mail',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.deepOrangeAccent),
                  ),
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Colors.black54),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () async {
                  if(_username.text.isEmpty){
                    setState(() {
                      error = 'Please enter your name';
                    });
                  }
                  else{
                    error = "";
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const WelcomePage(),
                          ));
                    });
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString("Username", _username.text);
                    Username = pref.getString("Username")!;
                    pref.setString("Email", _email.text);
                    Email = pref.getString("Email")!;
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrange),
                    fixedSize: MaterialStateProperty.all(const Size(400, 45))),
                child:
                    const Text("Get Started", style: TextStyle(fontSize: 20,color: Colors.black)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
