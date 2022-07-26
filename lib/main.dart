import 'package:conversor_de_moedas/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=8b2553da";

void main() async {
  print(await getData());
  runApp(
    const MyApp(),
  );
}

/*Future<Map> fetch() async {
  var url =
      "https://api.hgbrasil.com/finance/stock_price?key=8b2553da&symbol=bidi4";
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  return json;
}*/

Future<Map> getData() async {
  http.Response response = await http.get(
    Uri.parse(request),
  );
  return json.decode(response.body);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
