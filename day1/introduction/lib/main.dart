//first lines
// void main() {
//   print("Hello flutter");
// }

//follow https://medium.freecodecamp.org/how-to-build-a-cryptocurrency-price-list-app-using-flutter-sdk-1c75998e1a58
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

//use pubsect assist for vscode to resolve the missing library
import 'package:http/http.dart' as http;
import 'crypto_list_widget.dart';

void main() async {
  List currencies = await getCurrencies();

  runApp(
    new MaterialApp(
      home: new Center(
        child: new CryptoListWidget(currencies),
      ),
    ),
  );
}

Future<List> getCurrencies() async {
  String apiURL = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  //make http request
  http.Response response = await http.get(apiURL);
  //decode json to make and object
  return jsonDecode(response.body);
}

