import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_test/util/colors.dart';

class Cell extends StatelessWidget {
  const Cell({
    Key? key,
    this.padding = const EdgeInsets.all(16),
    this.alignment = Alignment.center,
    required this.child,
    this.showDivider = false,
    required this.trailing,
  })  : assert(padding != null),
        assert(alignment != null),
        assert(showDivider != null),
        super(key: key);

  final EdgeInsets padding;
  final Alignment alignment;
  final Widget child;
  final bool showDivider;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    const dividerHeight = 1.0;

    const trailingWidth = 36.0;

    Widget tree = Container(
      margin: padding,
      alignment: alignment,
      child: child,
    );

    if (trailing != null) {
      tree = SizedBox(
        child: Row(
          children: [
            Expanded(child: tree),
            SizedBox(
              width: trailingWidth,
              child: trailing,
            ),
          ],
        ),
      );
    }

    if (showDivider) {
      tree = Column(
        children: [
          tree,
          Padding(
            padding: EdgeInsets.zero.copyWith(left: padding.left),
            child: Divider(
              color: AppColors.green[50],
              height: dividerHeight,
            ),
          ),
        ],
      );
    }
    return tree;
  }
}
