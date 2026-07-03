/// Modelo de datos que representa una fotografía del grid.
///
/// En una aplicación real, esta información podría obtenerse desde una API,
/// como un backend propio o un servicio externo. Para esta actividad, los datos
/// se generan de forma local utilizando imágenes de muestra de picsum.photos.
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