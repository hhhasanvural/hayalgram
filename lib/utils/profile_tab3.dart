import 'package:flutter/material.dart';

class ProfileTab3 extends StatelessWidget {
  const ProfileTab3({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.blue[100],
            ),
          );
        });
  }
}
