import 'package:flutter/material.dart';
import '../models/photo.dart';

/// Celda individual del grid de fotos.
///
/// Muestra la imagen con esquinas redondeadas, un indicador de carga
/// mientras se descarga y un icono de error si la imagen no está
/// disponible. Al tocarla, abre un diálogo con la vista ampliada.
class PhotoGridTile extends StatelessWidget {
  final Photo photo;

  const PhotoGridTile({super.key, required this.photo});

  void _openPreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(photo.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.favorite_rounded, color: Colors.redAccent, size: 18),
                  const SizedBox(width: 6),
                  Text('${photo.likes}   @${photo.author}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openPreview(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          photo.imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Container(
              color: const Color(0xFFE9E6F7),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            color: const Color(0xFFE9E6F7),
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image_outlined, color: Colors.grey, size: 28),
          ),
        ),
      ),
    );
  }
}