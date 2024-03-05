import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/UTIL/extensions/extensions.dart';

class ExpandedLoader extends StatelessWidget {
  const ExpandedLoader({super.key, required this.loader});

  final Widget loader;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColor.withOpacity(0.1),
      height: double.infinity,
      width: double.infinity,
      child: Center(child: loader),
    );
  }
}
