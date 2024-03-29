import 'package:apibackendtest/Services/api_file.dart';
import 'package:apibackendtest/Services/apimodel.dart';
import 'package:apibackendtest/widgets/PhotoScreen.dart';
import 'package:apibackendtest/widgets/futurewidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Future<InternetModel>? Futuredata;

  @override
  void initState() {
    print("initstate has worked"); //This print line doesn't run
    super.initState();
    var obj = Internet();
    Futuredata = obj.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Color.fromARGB(219, 31, 188, 0),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FutureWidget(Futuredata: Futuredata);
                }));
              },
              child: Text("Small Size JSON"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PhotoListScreen();
                  }));
                },
                child: Text("Large Size JSON"))
          ],
        ),
      ),
    );
  }
}
