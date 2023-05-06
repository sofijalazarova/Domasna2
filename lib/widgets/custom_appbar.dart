import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{

  final String title;

  const CustomAppBar({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFE1D0BF),
      elevation: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child:  Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [IconButton(icon: const Icon(Icons.favorite), onPressed: () {
        Navigator.pushNamed(context, '/wishlist');
      },)],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}