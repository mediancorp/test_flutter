
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:project_test/util/router.dart';
import 'package:project_test/view/pages/detail/details_menu.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String apiUrl = "https://swapi.dev/api/species/";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),automaticallyImplyLeading: false
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            log('data: $snapshot');
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var url = snapshot.data[index]['url'];

                    return GestureDetector(
                        onTap: () {
                          log('data: $url');
                          Navigate.pushPage(context, DetailSPage(url: url));
                        },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                      ),
                      title: Text(snapshot.data[index]['name']),
                      subtitle: Text(snapshot.data[index]['classification']),
                    )
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}