import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final void Function(String)? onChanged;

  const AppSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: (value) {
        onChanged!(value);
      },
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
