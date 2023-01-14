import 'dart:convert';
import 'dart:async';
import 'package:apibackendtest/Services/apimodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Internet {
 Future<InternetModel> getdata() async {
    //Response class'i http call'dan gelen datayı içerir
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    //http.get() ile network request yapıyoruz.

    if (response.statusCode == 200) { //Eğer parslamada(Verilen json stringini çözümlemede)
     //**başarılı olunduysa statusCode 200 oluyor.
      return InternetModel.fromjson(jsonDecode(response.body));
    } 
    else {
      throw Exception('Failed to load album');
    }
  }
}
