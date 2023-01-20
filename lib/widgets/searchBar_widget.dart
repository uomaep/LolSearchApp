import 'package:flutter/material.dart';

import '../screens/detailScreen.dart';

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
  bool isActivity = false;

  void _handleSubmitted(String text) {
    inputText = inputController.text;
    inputController.clear();
    setState(() {
      isActivity = false;
    });
    if (inputText == '') return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(inputText: inputText),
      ),
    );
  }

  void _handleCanceled() {
    FocusManager.instance.primaryFocus?.unfocus();
    inputController.clear();
    setState(() {
      isActivity = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: const Color(0xFF1c1c1f),
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: Container(
              height: 40,
              margin: EdgeInsets.only(
                left: 16,
                right: isActivity ? 0 : 16,
                top: 8,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.white.withOpacity(isActivity ? 1.0 : 0.4),
                ),
              ),
              child: TextField(
                controller: inputController,
                onTap: () {
                  setState(() {
                    isActivity = true;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 2,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white.withOpacity(isActivity ? 1.0 : 0.6),
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
          ),
          isActivity
              ? Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: _handleCanceled,
                    child: const Text(
                      "취소",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
