import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      hintText: 'Search Apps',
      hintStyle: MaterialStateProperty.all(
        const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      side: MaterialStateProperty.all(
        const BorderSide(
          width: 1,
          color: Colors.black12,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.black45),
    );
  }
}
