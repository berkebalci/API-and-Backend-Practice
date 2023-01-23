import 'dart:convert';
import 'dart:async';
import 'package:apibackendtest/Services/apimodel.dart';
import 'package:apibackendtest/Services/apimodel2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoModifier {
  //Aiağıdaki metod birden fazla request yağacağından dolayı uygulamamazı yavaşlatacak.Bu yüzden ayrı bir Isolate'de
  //**yapmasını sağlamalıyız.

  Future<List<Photo>> getPhotos(http.Client client) async {
    //http.Client objesi vererek fonksiyonun test edilebilirliğini arttırdık
    //**ve performans arttı.
    final response =
        await client //Server'a birden fazla get request'i atacağımızdan dolayı client objesi oluşturduk.
            .get(Uri.parse(
                'https://jsonplaceholder.typicode.com/photos'));
    print((response.body).runtimeType);

    return compute(parsePhotos,response.body);  //Bu işlemi ayrı bir isolate'e alarak uygulamanın yavaşlamasini önledik 
    
    
    //'response' değişkenini tanımlarken asenkron bir işlem yağtığımızdan dolayı
    //**ve response.body'yi return ederken kullandığımızdan dolayı Future döndürülecek dedik.
  }

  List<Photo> parsePhotos(String responsebody) {
    //response body'yi fotolardan oluşan bir listeye dönüştürecek olan fonsksiyon

    final parsed = jsonDecode(responsebody).cast<Map<String, dynamic>>();
    //cast() metodu decode edilen responsebody'nin Map<String,dynamic> şeklinde olmasini garanti ediyor.
    //**Eğer cast'in içindeki
    print(parsed.runtimeType);
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
  
}
