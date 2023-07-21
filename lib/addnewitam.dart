import 'package:flutter/material.dart';
import 'data_storage.dart';
import 'customWidget.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool isHiddenContainerVisible = false;
  TextEditingController _textEditingController = TextEditingController();


  void toggleHiddenContainer() {
    setState(() {
      isHiddenContainerVisible = !isHiddenContainerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Header'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: toggleHiddenContainer,
                child: Container(
                  height: 20,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.orange,
                      width: 1.0,
                    ),
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 20,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.orange,
                    width: 1.0,
                  ),
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          if (isHiddenContainerVisible)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.grey,
                height: 50,
                child: Center(
                  child: Text('Hidden Container'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Check(),
  ));
}

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  bool showContainerData = false;
  List<Color> dynamicContainerColors = [
    Colors.yellow,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
  ];

  void addDynamicContainer() {
    setState(() {
      dynamicContainerColors.add(Colors.yellow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.red,
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                  showContainerData = !showContainerData;
                });
              },
              child: Container(
                height: 50,
                color: Colors.red,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (showContainerData) {
                      addDynamicContainer();
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    color: Colors.greenAccent,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 30,
                  width: 100,
                  color: Colors.greenAccent,
                ),
                SizedBox(width: 20),
                Container(
                  height: 30,
                  width: 100,
                  color: Colors.greenAccent,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showContainerData = !showContainerData;
                });
              },
              child: Container(
                height: 20,
                color: Colors.blue,
                child: Center(),
              ),
            ),
            if (showContainerData)
              Expanded(
                child: Container(
                  width: 350, // Expand to full width
                  color: Colors.blue,
                  child: ListView.builder(
                    itemCount: dynamicContainerColors.length,
                    itemBuilder: (context, index) {
                      Color color = dynamicContainerColors[index];
                      return Container(
                        height: 50,
                        color: color,
                        margin: EdgeInsets.only(bottom: 10),
                      );
                    },
                  ),
                ),
              ),
            Container(
              height: 20,
              color: Colors.orange,
              margin: EdgeInsets.only(bottom: 40),
            )
          ],
        ),
      ),
    );
  }
}
