import 'dart:io';
import 'package:apibackendtest/Services/api_file.dart';
import 'package:apibackendtest/Services/api_file2.dart';
import 'package:apibackendtest/Services/apimodel.dart';
import 'package:apibackendtest/Services/apimodel2.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PhotoList extends StatelessWidget {
  const PhotoList({super.key,required this.photos});
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    return GridView.builder( //TODO: Gridview'a da bak
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Image.network(photos[index].thumbnailUrl);
        });
  }
}
