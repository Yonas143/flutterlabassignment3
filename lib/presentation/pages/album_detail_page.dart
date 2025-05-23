import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/album_bloc.dart';
import '../blocs/album_state.dart';
import '../../data/models/photo_model.dart';

class AlbumDetailPage extends StatelessWidget {
  final int albumId;

  const AlbumDetailPage({required this.albumId, super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AlbumBloc>();
    final album = (bloc.state as AlbumLoaded)
        .albums
        .firstWhere((a) => a.id == albumId);
    final photo = (bloc.state as AlbumLoaded)
        .photos
        .firstWhere((p) => p.albumId == albumId,
            orElse: () => PhotoModel(albumId: 0, thumbnailUrl: ''));

    return Scaffold(
      appBar: AppBar(title: const Text("Album Detail")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(album.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            Image.network(photo.thumbnailUrl, width: 150),
          ],
        ),
      ),
    );
  }
}