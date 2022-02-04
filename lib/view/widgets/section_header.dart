import 'package:flutter/material.dart';
import 'package:project_test/view/widgets/cell.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.text,
  })  : assert(text != null),
        super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Cell(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
      alignment: Alignment.centerLeft,
      trailing: null,
      child: Text(text!,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
