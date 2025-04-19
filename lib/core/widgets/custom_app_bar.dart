import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(title, style: TextStyles.bold19, textAlign: TextAlign.center),
  );
}
