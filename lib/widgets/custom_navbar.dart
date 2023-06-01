import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white,),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              }),
              IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/userScreen');
              }),
          ],
        ),
      ),
    );
  }
}