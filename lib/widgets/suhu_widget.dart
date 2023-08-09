import 'package:flutter/material.dart';

class SuhuWidget extends StatelessWidget {
  String title;
  String nilai;
  SuhuWidget({super.key, required this.title, required this.nilai});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.yellowAccent,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text("${title}"),
          Text(
            "${nilai}",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
