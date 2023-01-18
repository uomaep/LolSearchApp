import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController inputController = TextEditingController();
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: const Color(0xFF1c1c1f),
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        child: TextField(
          controller: inputController,
          decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 4,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.6),
                size: 28,
              ),
            ),
            border: InputBorder.none,
            hintText: '소환사 검색',
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
          ),
          cursorColor: const Color(0xFF5383e8),
        ),
      ),
    );
  }
}
