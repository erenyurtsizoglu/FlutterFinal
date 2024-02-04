import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odev/models/song_model.dart';
import 'package:odev/widgets/player_buttons.dart';


class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late int selectedIndex;
  late Song song;

  @override
  void initState() {
    super.initState();
    selectedIndex = Get.arguments ?? 0;
    song = Song.songs[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            song.coverUrl,
            fit: BoxFit.cover,
            height: size.height * 0.6,
            width: size.width,
          ),
          const _BackgroundFilter(),
          _MusicPlayer(
            song: song,
          ),
        ],
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    Key? key,
    required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            song.description,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
          ),
          SizedBox(height: size.height * 0.03),
          const PlayerButtons(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.cloud_download,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          Colors.white,
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.0),
        ], stops: const [
          0.0,
          0.4,
          0.6
        ]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade800,
            ],
          ),
        ),
      ),
    );
  }
}
