
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project_test/util/router.dart';
import 'package:project_test/view/pages/detail/details_menu.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;
  List names = new List<String>.empty();
  int _page=0;
  String apiUrl = "https://swapi.dev/api/species/";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];
  }

  @override
  void initState() {
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }else if(_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent){
        _getLessData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),automaticallyImplyLeading: false
      ),
      resizeToAvoidBottomInset: false,

      body: FutureBuilder<List<dynamic>>(
        future: _fecthDataUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var url = snapshot.data[index]['url'];
                  return GestureDetector(
                      onTap: () {
                        Navigate.pushPage(context, DetailSPage(url: url));
                      },
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                    ),
                    title: Text(snapshot.data[index]['name']),
                    subtitle: Text(snapshot.data[index]['classification']),
                  )
                  );
                },
              controller: _scrollController,
            );
          } else {
            return Center(child: _buildProgressIndicator());
          }
        },
      ),
    );
  }

  void _getMoreData() async {
  if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      setState(() {
        isLoading = false;
        _page++;
        apiUrl = "https://swapi.dev/api/species/?page=$_page";
      });
    }
  }
  void _getLessData() async {
  if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      setState(() {
        isLoading = false;
        _page--;
        if(_page>0) {
          apiUrl = "https://swapi.dev/api/species/?page=$_page";
        }
      });
    }
  }

}