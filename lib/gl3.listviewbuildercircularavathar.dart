import 'package:flutter/material.dart';
import 'dart:io';

import 'header_and_futter_widget.dart';
import 'additemcontainer.dart';
import 'data_storage.dart';

import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  final String? imagePath;
  final String? stringData;
  final String? stringData2;
  final String? stringData3;

  NextPage({
    this.imagePath,
    this.stringData,
    this.stringData2,
    this.stringData3,
  });

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  bool showContainerData = false;

  List<ContainerData> containerList = [
    ContainerData(
      imagePath: Newlist.imagePath3,
      stringData: Newlist.stringData,
      stringData2: Newlist.stringData2,
      stringData3: Newlist.stringData3,
      // Add the necessary value for stringData4
    ),
    // Add more ContainerData objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgd.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Header Container
            headerContainer(context),
            SizedBox(height: 10),

            // Listdata Widget
            Listdata(
              imagePath: HuntingStorage.imagePath,
              stringData: HuntingStorage.stringData,
              stringData2: HuntingStorage.stringData2,
              stringData3: HuntingStorage.stringData3,
            ),

            // Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewItem()),
                    );
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 100,
                    height: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  color: Colors.green,
                  width: 100,
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.blue,
                    width: 100,
                    height: 50,
                  ),
                ),
              ],
            ),

            // GestureDetector for ContainerData2
            GestureDetector(
              onTap: () {
                setState(() {
                  showContainerData = !showContainerData;
                });
              },
              child: Container(
                height: 25,
                width: 380,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/category_box.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                '${widget.stringData3 ?? ''}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 100),
                            if (showContainerData)
                              Image.asset(
                                'assets/arrow.png',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              )
                            else
                              Image.asset(
                                'assets/arrow_open.png',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ContainerData2 Widgets with containerList.map
            if (showContainerData)
              Expanded(
                child: ListView(
                  children: containerList.map((containerData2) {
                    return Container(
                      margin: EdgeInsets.only(left: 18.0,top: 10), // Add the desired margin value
                      child: ContainerData2(
                        imagePath: containerData2.imagePath,
                        stringData: containerData2.stringData,
                        stringData2: containerData2.stringData2,
                        stringData3: containerData2.stringData3,

                      ),
                    );
                  }).toList(),
                ),
              ),

            SizedBox(height: 10),
            Container(
              height: 25,
              width: 380,
              color: Colors.orange,
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: footerContainer(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







class ContainerData2 extends StatefulWidget {
  final String? imagePath;
  final String? stringData;
  final String? stringData2;
  final String? stringData3;
  final String? stringData4;

  ContainerData2({
    this.imagePath,
    this.stringData,
    this.stringData2,
    this.stringData3,
    this.stringData4,
  });

  @override
  _ContainerData2State createState() => _ContainerData2State();
}

class _ContainerData2State extends State<ContainerData2> {
  bool isGreen = false;
  bool isRed = false;
  bool isCheckClicked = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.stringData ?? ''),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        // Handle the deletion here (e.g., remove the container from the list)
        // You can add your custom logic to handle the dismissal action
      },
      background: Container(
        width: 50,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Image.asset(
              'assets/delete_column_button.png',

            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isGreen = true;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isGreen ? Colors.green : (isRed ? Colors.red : Colors.black),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.white, width: 2.0),
          ),
          height: 100,
          width: 370,
          child: Stack(
            children: [
              if (isCheckClicked)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Icon(
                    Icons.star, // Replace with your custom icon data
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                    child: Image.file(
                      File(widget.imagePath ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.stringData ?? ''}',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${widget.stringData2 ?? ''}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${widget.stringData3 ?? ''}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!isCheckClicked)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRed = true;
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 63,
                        child: Image.asset(
                          'assets/x_filled.png',
                        ),
                      ),
                    ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isGreen = true;
                        isCheckClicked = true;
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 63,
                      child: Image.asset(
                        'assets/check_filled.png',
                        width: 50,
                        height: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




