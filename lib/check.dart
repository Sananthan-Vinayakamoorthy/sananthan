import 'dart:io';
import 'package:flutter/material.dart';
import 'user.login.dart';
import 'package:image_picker/image_picker.dart';
import 'data_storage.dart';

class Check extends StatefulWidget {
  final ContainerData containerData;

  const Check({required this.containerData});

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  bool showContainerData = false;
  List<ContainerData> containerList = [];

  @override
  void initState() {
    super.initState();
    // Initially, add a single container
    containerList.add(widget.containerData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Userpage()),
                  ).then((containerData) {
                    // When returning from Userpage, add a new container
                    if (containerData != null) {
                      setState(() {
                        containerList.add(containerData);
                      });
                    }
                  });
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 100,
                height: 50,
                color: Colors.red,
              ),
              SizedBox(width: 20),
              Container(
                width: 100,
                height: 50,
                color: Colors.red,
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
              height: 50,
              width: double.infinity,
              color: Colors.red,
            ),
          ),
          Visibility(
            visible: showContainerData,
            child: Container(
              width: double.infinity, // Set the desired width here
              child: ListView.builder(
                itemCount: containerList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    color: Colors.red,
                    width: double.infinity, // Set the desired width for the hidden container
                    child: ContainerData(
                      // Add a unique key
                      imagePath: containerList[index].imagePath,
                      stringData: containerList[index].stringData,
                      stringData2: containerList[index].stringData2,
                      stringData3: containerList[index].stringData3,
                      stringData4: containerList[index].stringData4,
                    ),
                  );
                },
              ),
            ),
          ),


          SizedBox(height: 10),
          Container(
            height: 50,

            color: Colors.blueAccent,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Test(),
                ),
              );
            },
            child: Text('Go to Test'),
          ),
        ],
      ),
    );
  }
}
