import 'package:flutter/material.dart';
import '../models/photo.dart';
import '../widgets/photo_grid_tile.dart';

/// Pantalla que muestra un grid de fotografías al estilo Instagram.
///
/// Usa GridView.builder con 3 columnas, separación uniforme entre celdas
/// y desplazamiento vertical. Las imágenes se generan con
/// Photo.generateSampleData y se cargan de forma perezosa desde la red.
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late final List<Photo> _photos;

  @override
  void initState() {
    super.initState();
    _photos = Photo.generateSampleData(30);
  }

  void _logout() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi galería'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            tooltip: 'Cerrar sesión',
            icon: const Icon(Icons.logout_rounded),
            onPressed: _logout,
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(2),
        itemCount: _photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1, // celdas cuadradas
        ),
        itemBuilder: (context, index) {
          return PhotoGridTile(photo: _photos[index]);
        },
      ),
    );
  }
}