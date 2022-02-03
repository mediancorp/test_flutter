
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_test/model/detail.dart';

class DetailSPage extends StatefulWidget {
  const DetailSPage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _DetailSPageState createState() => new _DetailSPageState();
}

class _DetailSPageState extends State<DetailSPage> {
  late String apiUrl = widget.url;
  Future<DetailsModel> getUser() async {
    var response = await http.get(
      Uri.parse(apiUrl),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      DetailsModel user = DetailsModel.fromJson(data);
      return user;
    } else {
      print(response.body);
      throw Exception('Failed');
    }
  }
  @override
  void initState() {
    super.initState();
    getAsync();
  }
  DetailsModel? details;
  getAsync() async {
    try {
      details = await getUser();
    } catch (e) {
      print(e);
    }

    if (mounted) setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Detail'),automaticallyImplyLeading: false
    ),
    body: Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      color: Colors.white,
    child: FutureBuilder<DetailsModel>(
    future: getUser(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 10),
             _textDetail("nama", details?.name??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("classification", details?.classification??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("designation", details?.designation??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("average_height", details?.average_height??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("skin colors", details?.skin_colors??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("hair colors", details?.hair_colors??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("eye colors", details?.eye_colors??""),
             SizedBox(
               height: 7,
             ),
             _textDetail("average_lifespan", details?.average_lifespan??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("homeworld", details?.homeworld??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("language", details?.language??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("created", details?.created??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("edited", details?.edited??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("url", details?.url??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("films", details?.people?[0]??""),
             SizedBox(
               height: 5,
             ),
             _textDetail("films", details?.films?[0]??""),
             SizedBox(
               height: 5,
             ),
           ],
         ),
        );}
           else {
      return Center(child: CircularProgressIndicator());
    }
    },
    ),
        ),
      );
  }
_textDetail(String title, String text){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Expanded(flex: 1, child: Text(title,
        style: TextStyle(fontSize: 13, color: Colors.black),
      )),
      Expanded(flex: 1, child: Text(" :",
        style: TextStyle(fontSize: 13, color: Colors.black),
      )),
      Expanded(
          flex:2,
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: Colors.black),
          )),
    ],
  );
}
}