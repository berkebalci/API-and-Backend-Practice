// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InternetModel {
  final int userId;
  final int id;
  final String title;
  const InternetModel({
    required this.userId,
    required this.id,
    required this.title,
  });
  factory InternetModel.fromjson(Map<String, dynamic> json) {
    return InternetModel
    (
        userId: json['userId'], id: json['id'], title: json['title']);
  }
}
