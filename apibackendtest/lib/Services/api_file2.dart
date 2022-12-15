import 'dart:convert';
import 'dart:async';
import 'package:apibackendtest/Services/apimodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Internet2 {
  Future<http.Response> getPhotos(http.Client client) async { //http.Client objesi vererek fonksiyonun test edilebilirliğini arttırdık
  //**ve performans arttı.
    return client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'));
    }
}
