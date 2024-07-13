import 'package:flutter/material.dart';

class MyBillsSearch extends StatelessWidget {
  const MyBillsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.search),
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}
