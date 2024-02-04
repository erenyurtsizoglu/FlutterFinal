import 'package:flutter/material.dart';
import 'package:odev/models/playlist_model.dart';
import 'package:odev/models/song_model.dart';
import 'package:odev/widgets/playlist_card.dart';
import 'package:odev/widgets/song_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Song> songs = Song.songs;
  final List<Playlist> playlist = Playlist.playlists;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          //sayfayı mordan açık mora yapan kod kısmı
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
        Colors.deepPurple.shade800.withOpacity(0.8),
        const Color.fromARGB(255, 174, 0, 255).withOpacity(0.8),
        const Color(0xff886AE2).withOpacity(0.8),
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.grid_view_rounded),
          actions: [
            Container(
              margin: EdgeInsets.only(right: size.width * 0.05),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [const _DiscoverMusic(), _TrendingMusic(songs: songs), _PlaylistMusic(playlist: playlist)],
          ),
        ),
      ),
    );
  }
}

class _DiscoverMusic extends StatefulWidget {
  const _DiscoverMusic({Key? key}) : super(key: key);

  @override
  State<_DiscoverMusic> createState() => _DiscoverMusicState();
}

class _DiscoverMusicState extends State<_DiscoverMusic> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.005),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome My Music App",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade200, fontSize: 15),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            'Enjoy your favorite music',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade200, fontSize: 25),
          ),
          SizedBox(height: size.height * 0.02),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(15),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade400,
                    ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.035, vertical: size.height * 0.02),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Trending Music',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
              )),
          SizedBox(height: size.height * 0.02),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index], index: index); // Provide the 'index'
              },
            ),
          )
        ],
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final List<Playlist> playlist;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Play List',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
              )),
          ListView.builder(
            padding: EdgeInsets.only(top: size.height * 0.02),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              return PlaylistCard(
                playlist: playlist[index],
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
