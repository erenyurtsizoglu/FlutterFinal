import 'package:flutter/material.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.01,
          width: size.width * 0.9,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
        ),
        SizedBox(height: size.height * 0.02),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 50,
            ),
            Icon(
              Icons.play_circle,
              color: Colors.white,
              size: 70,
            ),
            Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
      ],
    );
  }
}
