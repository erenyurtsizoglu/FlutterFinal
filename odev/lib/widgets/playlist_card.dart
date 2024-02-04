import 'package:flutter/material.dart';
import '../models/playlist_model.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    Key? key,
    required this.playlist,
    required this.index,
  }) : super(key: key);

  final Playlist playlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/playlist', (route) => true, arguments: index);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.015),
        child: Material(
          elevation: 10,
          color: Colors.transparent,
          child: Container(
            height: size.height * 0.1,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade500.withOpacity(0.6),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    playlist.imageUrl,
                    height: size.height * 0.07,
                    width: size.width * 0.15,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        playlist.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text('${playlist.songs.length} songs',
                          maxLines: 2, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
