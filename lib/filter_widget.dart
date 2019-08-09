import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey.withOpacity(0.5),width: 1)
      ),
      child: IconButton(icon: Icon(Icons.filter_list,color: Colors.black,), onPressed: () {}),
    );
  }
}
