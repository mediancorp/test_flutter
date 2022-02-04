import 'package:flutter/material.dart';
import 'package:project_test/view/widgets/cell.dart';

class InfoSpecies extends StatelessWidget {
  const InfoSpecies({
    Key? key,
    required this.category,
    required this.value,
  })  : assert(category != null),
        assert(value != null),
        super(key: key);

  final String category;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Cell(
      showDivider: true,
      trailing: null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(category, style: TextStyle(fontSize: 15, color: Colors.black)),
          Text(value, style: TextStyle(fontSize: 13, color: Colors.black)),
        ],
      ),
    );
  }
}
