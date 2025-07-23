import 'package:book_app/core/utils/style/style.dart';
import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return   Center(child: Text(text,style: Styles.textStyle30,));
  }
}