class Song {
  final String title;
  final String description;
  final String coverUrl;

  Song({required this.title, required this.description, required this.coverUrl});

  static List<Song> songs = [
    Song(
      title: 'Cevapsız Sorular',
      description: 'Single',
      coverUrl: 'assets/images/manga.jpg',
    ),
    Song(
      title: 'Pembe Mezarlık',
      description: 'Single',
      coverUrl: 'assets/images/model.jpg',
    ),
    Song(
      title: 'Senden daha güzel',
      description: 'Single',
      coverUrl: 'assets/images/duman.jpg',
    )
  ];
}
