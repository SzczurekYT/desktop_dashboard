import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubscribersCount extends StatelessWidget {
  int count = 0;
  String url = "";

  Future<http.Response> req() {
    return http.get(Uri.parse(url));
  }

  SubscribersCount({Key? key}) : super(key: key) {
    count = 0;
    const String key = "AIzaSyDN2d6zSDmdDOjHolsaQJ1iPK2JWAksn90";
    url =
        "https://youtube.googleapis.com/youtube/v3/channels?part=statistics&id=UCoMLThz0vS5OCh8Inl3Z6hg&key=$key";

    // String text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(count.toString()),
    );
  }
}
