import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

List<String> imageslist = [
  "https://vinusimages.co/wp-content/uploads/2018/10/EG7A8457.jpg",
  "https://vinusimages.co/wp-content/uploads/2018/10/EG7A9856.jpg",
  "https://vinusimages.co/wp-content/uploads/2018/10/EG7A8125-1024x819.jpg",
  "https://vinusimages.co/wp-content/uploads/2018/10/615A8940-e1609745384736-1024x814.jpg",
  "https://vinusimages.co/wp-content/uploads/2018/10/EG7A8457.jpg",
  "https://vinusimages.co/wp-content/uploads/2018/10/EG7A9856.jpg",
  "https://vinusimages.co/wp-content/uploads/2018/10/EG7A8125-1024x819.jpg",
  "https://vinusimages.co/wp-content/uploads/2018/10/615A8940-e1609745384736-1024x814.jpg"
];

List<Widget> cards = List.generate(
  imageslist.length,
  (int index) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23.0,
              spreadRadius: -13.0,
              color: Colors.black54,
            )
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 400,
                child: Image.network(
                  imageslist[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(
            //   height: 4,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.black,
                height: 100.0,
                child: Text(
                    'ABDHUIE HFU IEGHIUEGIUAE GHUIGHU HEUIUY THUIERHUI HURGUIRHG UIRUH RUIIEHRUEF'),
              ),
            ),
            // SizedBox(
            //   height: 5.0,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {},
                  color: Colors.red,
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  },
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutShell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TCardController _controller = TCardController();

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.cyan,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            height: 700,
            width: size.width,
            child: TCard(
              cards: cards,
              controller: _controller,
              onForward: (index, info) {
                _index = index;
                print(info.direction);
                setState(() {});
              },
              onBack: (index, info) {
                _index = index;
                setState(() {});
              },
              onEnd: () {
                print('end');
              },
            ),
          ),
        ));
  }
}
