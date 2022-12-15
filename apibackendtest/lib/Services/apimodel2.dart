// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:apibackendtest/Services/apimodel.dart';

class InternetModel2 {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  InternetModel2({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl
  });
  factory InternetModel2.fromJson(Map<String, dynamic> json) {
    return InternetModel2(
        albumId: json['albumId'] as int, 
        id: json['id'] as int, 
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String
        );
        
  }
}
