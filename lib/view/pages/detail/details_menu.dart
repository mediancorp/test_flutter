import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_test/model/detail.dart';
import 'package:project_test/util/colors.dart';
import 'package:project_test/view/widgets/section_header.dart';
import 'package:project_test/view/widgets/species.dart';

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
      appBar: AppBar(title: Text('Detail'), automaticallyImplyLeading: false),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        color: Colors.white,
        child: FutureBuilder<DetailsModel>(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView(
                  children: [_textDetail()],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  _textDetail() {
    return Card(
      child: Container(
        width: double.infinity,
        color: AppColors.orange[50],
        child: Column(
          children: [
            SectionHeader(text: 'Species Information'),
            InfoSpecies(category: 'Name', value: details?.name ?? ""),
            InfoSpecies(
                category: 'Class', value: details?.classification ?? ""),
            InfoSpecies(
                category: 'Designation', value: details?.designation ?? ""),
            InfoSpecies(
                category: 'Height', value: details?.average_height ?? ""),
            InfoSpecies(
                category: 'Skin Color', value: details?.skin_colors ?? ""),
            InfoSpecies(
                category: 'Eye Color', value: details?.eye_colors ?? ""),
            InfoSpecies(
                category: 'Life Span', value: details?.average_lifespan ?? ""),
            InfoSpecies(category: 'Language', value: details?.language ?? ""),
          ],
        ),
      ),
    );
  }
}
