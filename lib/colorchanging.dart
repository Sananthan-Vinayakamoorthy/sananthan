import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: ColorChangingContainerAppPage(),
  ));
}

class ColorChangingContainerAppPage extends StatefulWidget {
  @override
  _ColorChangingContainerAppPageState createState() =>
      _ColorChangingContainerAppPageState();
}

class _ColorChangingContainerAppPageState
    extends State<ColorChangingContainerAppPage> {
  int containerCount = 1; // Initial container count

  void updateContainerCount(String input) {
    setState(() {
      containerCount = int.tryParse(input) ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changing Container'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: containerCount,
              itemBuilder: (context, index) {
                return ColorChangingContainer();
              },
            ),
          ),
        ],
      ),
    );
  }
}




class ColorChangingContainer extends StatefulWidget {
  @override
  _ColorChangingContainerState createState() => _ColorChangingContainerState();
}

class _ColorChangingContainerState extends State<ColorChangingContainer> {
  Color containerColor = Colors.blue; // Initial color

  void changeColor() {
    setState(() {
      containerColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeColor();
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 200,
        height: 200,
        color: containerColor,
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Change Color'),
          ),
        ),
      ),
    );
  }
}
