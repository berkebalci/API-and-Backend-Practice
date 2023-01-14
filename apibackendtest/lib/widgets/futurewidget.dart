import 'package:apibackendtest/Services/api_file.dart';
import 'package:apibackendtest/Services/apimodel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class FutureWidget extends StatelessWidget {
  const FutureWidget({
    Key? key,
    required this.Futuredata,
  }) : super(key: key);

  final Future<InternetModel>? Futuredata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<InternetModel>(
          future: Futuredata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.title);
              print(snapshot.data!.userId);
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
