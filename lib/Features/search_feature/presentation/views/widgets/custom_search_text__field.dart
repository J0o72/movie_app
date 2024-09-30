import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({
    super.key,
  });

  final myController = TextEditingController();
  String? text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      onChanged: (value) {
        // text = value;
      },
      onSubmitted: (value) {},
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
