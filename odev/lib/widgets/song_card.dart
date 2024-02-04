import 'package:flutter/material.dart';
import '../models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    Key? key,
    required this.song,
    required this.index,
  }) : super(key: key);

  final Song song;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/song', (route) => true, arguments: index);
      },
      child: Container(
        margin: EdgeInsets.only(right: size.width * 0.025),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: size.width * 0.45,
                height: size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(song.coverUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * 0.07,
              width: size.width * 0.4,
              margin: EdgeInsets.only(bottom: size.height * 0.025),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                      ),
                      Text(
                        song.description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
