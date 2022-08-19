import 'package:flutter/material.dart';

class AddRecord extends StatelessWidget {
  const AddRecord({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Record",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Form(
            child: ListView(padding: EdgeInsets.all(15), children: [
          Text(
            "Select product image",
            style: TextStyle(fontSize: 18),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Select image source'),
                      content: Column(children: [
                        ListTile(
                          title: Text("Select from Gallery"),
                        )
                      ]),
                    );
                  });
            },
            child: Image.asset("assets/placeholder.jpg"),
          ),
        ])));
  }
}
