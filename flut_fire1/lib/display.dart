import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Display extends StatefulWidget {
  final List<dynamic> dispdetails;
  Display({super.key, required this.dispdetails});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(
            child: Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(widget.dispdetails[index]['name']),
                subtitle: Text(widget.dispdetails[index]['sub']),
                trailing: InkWell(
                  child: Icon(Icons.cancel),
                  onTap: () {
                    deleteTheDetails(index);
                  },
                ),
                onTap: () {
                  print("Tapped on ${widget.dispdetails[index]['name']}");
                },
              ),
            ),
          );
        },
        itemCount: widget.dispdetails.length,
      ),
    );
  }

  deleteTheDetails(index) {
    setState(() {
      widget.dispdetails.removeAt(index);
    });
  }
}
