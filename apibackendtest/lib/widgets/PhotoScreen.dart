import 'dart:io';

import 'package:apibackendtest/Services/api_file.dart';
import 'package:apibackendtest/Services/api_file2.dart';
import 'package:apibackendtest/Services/apimodel.dart';
import 'package:apibackendtest/Services/apimodel2.dart';
import 'package:apibackendtest/widgets/PhotoList.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PhotoListScreen extends StatelessWidget {
  //This is for large JSON
  const PhotoListScreen({Key? key}) : super(key: key);
  //TODO: chatgpt'de snapshot ve context ile ilgili bilgiyi oku
  @override
  Widget build(BuildContext context) {
    var object = PhotoModifier();
    return Scaffold(
      appBar: AppBar(title: Text("Large JSON List")),
      body: Column(children: [
        FutureBuilder<List<Photo>>(
            future: object.getPhotos(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("An error has occured")
                );
              } 
              else if (snapshot.hasData) {
                return PhotoList(photos: snapshot.data!);
              } 
              else {
                return  const CircularProgressIndicator();
              }
            },
            )
      ]),
    );
  }
}
