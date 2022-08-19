import 'package:flutter/material.dart';
import 'package:myproject/addrecord.dart';
import 'package:myproject/recorditem.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xff1a1919)),
          title: RichText(
            text: TextSpan(
              text: 'Farm',
              style: TextStyle(color: Color(0xff6c866d)),
              children: [
                TextSpan(
                  text: 'Keep',
                  style: TextStyle(
                    color: Color(0xff426944),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          elevation: 2,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1658847237629-35603a4c151e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDc0fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRecord(),
                ));
          },
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                  text: 'Record book for',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Farm 1',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
                TextButton(
                  onPressed: (() {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: ((context) {
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(children: [
                                Expanded(
                                  child: QrImage(
                                    data: 'This is a simple QR code',
                                    version: QrVersions.auto,
                                    size: 320,
                                    gapless: false,
                                  ),
                                ),
                                Text(
                                  'Scan QR Code to download record book',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Close',
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ]),
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                  child: Row(
                    children: [
                      Text('GENERATE QR CODE',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black)),
                      Icon(
                        Icons.qr_code,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            OrientationBuilder(builder: ((context, orientation) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return const InkWell(
                    child: RecordItem(),
                  );
                },
                itemCount: 20,
              );
            })),
          ],
        ));
  }
}
