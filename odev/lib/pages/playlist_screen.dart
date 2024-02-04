import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/playlist_model.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late int selectedIndex;
  late Playlist playlist;

  @override
  void initState() {
    super.initState();
    selectedIndex = Get.arguments ?? 0;
    playlist = Playlist.playlists[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          //sayfayı mordan açık mora yapan kod kısmı
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
        Colors.deepPurple.shade800.withOpacity(0.8),
        Colors.deepPurple.shade200.withOpacity(0.8),
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          title: const Text(
            'Playlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                _PlaylistInformation(playlist: playlist),
                SizedBox(height: size.height * 0.05),
                const _PlayOrShuffleSwitch(),
                _PlaylistSong(playlist: playlist)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaylistSong extends StatelessWidget {
  const _PlaylistSong({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlist.songs.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            '${index + 1}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          title: Text(
            playlist.songs[index].title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Text(
            '${playlist.songs[index].description} / 2:45',
            style: const TextStyle(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        );
      },
    );
  }
}

class _PlayOrShuffleSwitch extends StatefulWidget {
  const _PlayOrShuffleSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<_PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<_PlayOrShuffleSwitch> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: size.height * 0.065,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isPlay ? 0 : size.width * 0.45,
            child: Container(
              height: size.height * 0.065,
              width: size.width * 0.45,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Play',
                        style: TextStyle(
                          color: isPlay ? Colors.white : Colors.deepPurple,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Icon(
                      Icons.play_circle,
                      color: isPlay ? Colors.white : Colors.deepPurple,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Shuffle',
                        style: TextStyle(
                          color: isPlay ? Colors.deepPurple : Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Icon(
                      Icons.shuffle,
                      color: isPlay ? Colors.deepPurple : Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class _PlaylistInformation extends StatelessWidget {
  const _PlaylistInformation({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            playlist.imageUrl,
            height: size.height * 0.3,
            width: size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          playlist.title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
