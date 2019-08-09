import 'package:flutter/material.dart';
class SearchIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal.shade100
      ),
      child: Icon(
        Icons.search,
        color: Colors.black,
      ),
    );
  }
}
