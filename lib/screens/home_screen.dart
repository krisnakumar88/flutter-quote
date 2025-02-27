import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Quotes App")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(quote, style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(" - $author", style: TextStyle(fontSize: 18)),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {});

                var url = Uri.parse('https://dummyjson.com/quotes/random');
                var response = await http.get(url);
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');

                var data = jsonDecode(response.body);

                quote = data['quote'];
                author = data['author'];

                setState(() {
                  
                });

                
              },
              child: Text("Generate Quote"),
            ),
          ],
        ),
      ),
    );
  }
}
