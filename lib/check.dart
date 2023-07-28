import 'package:flutter/material.dart';
import 'api_service.dart';
import 'fakemain.dart';

class DataViewer extends StatefulWidget {
  @override
  _DataViewerState createState() => _DataViewerState();
}

class _DataViewerState extends State<DataViewer> {
  final ApiService apiService = ApiService();
  dynamic _data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final data = await apiService.fetchData();
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Viewer'),
      ),
      body: Center(
        child: _data != null
            ? Text('Data: $_data') // You can display the data in any way you like.
            : CircularProgressIndicator(), // Show a loading indicator while fetching data.
      ),
    );
  }
}
