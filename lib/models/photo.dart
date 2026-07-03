/// Modelo de datos que representa una fotografía del grid.
///
/// En una app real, esta lista vendría de una API (por ejemplo, un backend
/// propio o un servicio como Unsplash). Para esta actividad se genera de
/// forma local usando un servicio público de imágenes de muestra
/// (picsum.photos), identificando cada foto por un [id] y una URL.
class Photo {
  final int id;
  final String imageUrl;
  final String author;
  final int likes;

  const Photo({
    required this.id,
    required this.imageUrl,
    required this.author,
    required this.likes,
  });

  /// Genera una lista de fotos de muestra.
  static List<Photo> generateSampleData(int count) {
    final authors = [
      'pedro.lara',
      'gonzalo.mariscal',
      'juanpi.pinuela',
      'santi.torres',
      'abdel.himri',
      'alberto.garcia',
    ];

    return List.generate(count, (index) {
      final id = index + 1;
      return Photo(
        id: id,
        imageUrl: 'https://picsum.photos/seed/steam_$id/500/500',
        author: authors[index % authors.length],
        likes: 12 + (id * 7) % 480,
      );
    });
  }
}