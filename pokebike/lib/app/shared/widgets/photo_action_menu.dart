/// NUOVO UPDATE MATTEO
/// Popup menu per azioni su foto: Mi piace e Segnala.
import 'package:flutter/material.dart';
import 'package:moto_hunters/app/data/models/api_media/api_media.dart';

typedef OnLike = void Function();
typedef OnReport = Future<void> Function();

/// NUOVO UPDATE MATTEO
/// PhotoActionMenu mostra un PopupMenuButton accessibile
class PhotoActionMenu extends StatelessWidget {
  final OnLike onLike;
  final OnReport onReport;
  final ApiMedia media;

  const PhotoActionMenu({
    Key? key,
    required this.onLike,
    required this.onReport,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            center: Alignment.center,
            colors: [
              Colors.black.withAlpha(200),
              Colors.transparent,
            ],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(20),
      ),
      child: PopupMenuButton<_Option>(
        icon: const Icon(Icons.more_vert,
            color: Colors.white, semanticLabel: 'Azioni foto'),
        tooltip: 'Azioni foto',
        onSelected: (opt) async {
          switch (opt) {
            case _Option.like:
              onLike();
              break;
            case _Option.report:
              await onReport();
              break;
          }
        },
        itemBuilder: (_) => [
          PopupMenuItem(
            value: _Option.like,
            child: ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Mi piace'),
            ),
          ),
          if (media.id != -1)
            PopupMenuItem(
              value: _Option.report,
              child: ListTile(
                leading: const Icon(Icons.flag_outlined),
                title: const Text('Segnala'),
              ),
            ),
        ],
      ),
    );
  }
}

enum _Option { like, report }
