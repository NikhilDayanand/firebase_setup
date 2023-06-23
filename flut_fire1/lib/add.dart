// import 'dart:js';

import 'package:flut_fire1/display.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  List<dynamic> details = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Name"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _age,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Age"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _subject,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Subject"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showMessage();
                  // navigateToAddPage();
                },
                child: Text("Add")),
          ],
        ),
      ),
    );
  }

  showMessage() {
    try {
      String name = _name.text;
      int age = int.parse(_age.text);
      String sub = _subject.text;
      if (name.isNotEmpty && !age.isNaN && sub.length > 10) {
        print(name);
        print(age);
        print(sub);
        showSuccess();
        Object data = {'name': name, 'age': age, 'sub': sub};
        details.add(data);
        print(details);
        navigateToAddPage();
      } else {
        showFailure("Failed");
      }
      _name.clear();
      _age.clear();
      _subject.clear();
      // setState(() {});
    } catch (e) {
      showFailure(e);
    }
    // setState(() {
    //   _name.clear();
    //   _age.clear();
    // });
  }

  void showSuccess() {
    final snack = SnackBar(
      content: Text("Added successfully"),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  void showFailure(Object e) {
    final snack = SnackBar(
      content: Text(e.toString()),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  navigateToAddPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Display(
                dispdetails: details,
              )),
    );
  }
}
