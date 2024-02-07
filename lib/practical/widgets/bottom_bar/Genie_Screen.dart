import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';


import '../../../models/modelData.dart'; // Replace with your actual path

class Genie_Screen extends StatefulWidget {
  const Genie_Screen({Key? key}) : super(key: key);

  @override
  _Genie_ScreenState createState() => _Genie_ScreenState();
}

class _Genie_ScreenState extends State<Genie_Screen> {
  List<ModelData> dataList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      String jsonString = await rootBundle.rootBundle.loadString("jsonData/data.json");
      List<dynamic> jsonList = json.decode(jsonString);
      setState(() {
        dataList = jsonList.map((json) => ModelData.fromJson(json)).toList();
      });
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genie Screen'),
      ),
      body: dataList.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : dataList.isNotEmpty
          ? ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          ModelData data = dataList[index];
          return ListTile(
            leading: Image.network(data.image!),
            title: Text(data.title!),

            // Add more widgets to display other properties
          );
        },
      )
          : Center(child: Text('No data available')), // Show message if data is empty
    );
  }
}
