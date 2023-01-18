import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      color: const Color(0xFF1c1c1f),
      width: double.infinity,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "즐겨찾기한 소환사",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                    ),
                    Text(
                      "즐겨찾기한 소환사가 없습니다.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "소환사를 검색한 후 등록해주세요!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
