import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Duman',
      songs: Song.songs,
      imageUrl: 'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO43NcNz-default.jpg',
    ),
    Playlist(
      title: 'Manga',
      songs: Song.songs,
      imageUrl: 'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO4pjcGq-default.jpg',
    ),
    Playlist(
      title: 'Model',
      songs: Song.songs,
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b2739b0126ef6771d5b2d1432c00',
    )
  ];
}
