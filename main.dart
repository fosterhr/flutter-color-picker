import 'package:flutter/material.dart';

void main() => runApp(Main());

var rgb = [0, 0, 0];
String hex = "000000";

var hexArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];

class Main extends StatefulWidget {
  MainLayout createState() => new MainLayout();
}

class MainLayout extends State<Main> {
  void update() {
    setState(() => hex = first() + second() + third());
  }
  String first() { return hexArray[int.parse((rgb[0] / 16).toString().split(".")[0])] + hexArray[(((double.parse(rgb[0].toString()) / 16) - int.parse((rgb[0] / 16).toString().split(".")[0])) * 16).round()]; }
  String second() { return hexArray[int.parse((rgb[1] / 16).toString().split(".")[0])] + hexArray[(((double.parse(rgb[1].toString()) / 16) - int.parse((rgb[1] / 16).toString().split(".")[0])) * 16).round()]; }
  String third() { return hexArray[int.parse((rgb[2] / 16).toString().split(".")[0])] + hexArray[(((double.parse(rgb[0].toString()) / 16) - int.parse((rgb[0] / 16).toString().split(".")[0])) * 16).round()]; }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 50,
                child: Container(
                  color: Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1),
                ),
              ),
              Expanded(
                flex: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "RGB(" + rgb[0].toString() + ", " + rgb[1].toString() + ", " + rgb[2].toString() + ")",
                      style: new TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "#" + hex,
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 35,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Red: " + rgb[0].toString()),
                      Slider(
                        value: rgb[0].toDouble(),
                        min: 0,
                        max: 255,
                        label: rgb[0].round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            rgb[0] = value.round();
                            update();
                          });
                        },
                      ),
                      Text("Green: " + rgb[1].toString()),
                      Slider(
                        value: rgb[1].toDouble(),
                        min: 0,
                        max: 255,
                        label: rgb[1].round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            rgb[1] = value.round();
                            update();
                          });
                        },
                      ),
                      Text("Blue: " + rgb[2].toString()),
                      Slider(
                        value: rgb[2].toDouble(),
                        min: 0,
                        max: 255,
                        label: rgb[2].round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            rgb[2] = value.round();
                            update();
                          });
                        },
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
