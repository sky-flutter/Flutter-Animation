import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
            border: border,
            errorBorder: border,
            focusedBorder: border,
            contentPadding:
                EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 8),
            enabledBorder: border,
            enabled: false,
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            filled: true,
            fillColor:Colors.grey.shade100,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  var border =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.grey.shade100,));
}
