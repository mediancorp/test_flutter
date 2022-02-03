import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DkScaffold extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget body;
  final AppBar? appBar;
  final FloatingActionButton? floatingActionButton;

  static Uint8List? headerImage;

  DkScaffold(
      {required this.body,
      this.scaffoldKey,
      this.appBar,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    if (headerImage == null) {
      loadHeaderImage();
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          headerImage == null ? SizedBox() : _drawBackgroundImage(),
          SafeArea(child: this.body)
        ],
      ),
    );
  }

  _drawBackgroundImage() {
    return Image.memory(headerImage!);
  }

  static loadHeaderImage() {
    rootBundle.load('images/header_bg.png').then((data) {
      headerImage = data.buffer.asUint8List();
    });
  }
}
