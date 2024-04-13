import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          child: const Row(
            children: <Widget>[
              Text(
                "For You",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Icon(
                Icons.search_rounded,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
