import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/album_bloc.dart';
import '../blocs/album_state.dart';
import '../../data/models/photo_model.dart';

class AlbumListPage extends StatelessWidget {
  const AlbumListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];
                final photo = state.photos.firstWhere(
                    (p) => p.albumId == album.id,
                    orElse: () => PhotoModel(albumId: 0, thumbnailUrl: ''));
                return ListTile(
                  leading: Image.network(photo.thumbnailUrl, width: 50, height: 50, errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported)),
                  title: Text(album.title),
                  onTap: () => context.go('/album/${album.id}'),
                );
              },
            );
          } else if (state is AlbumError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}