import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_event.dart';
import 'album_state.dart';
import '../../data/repositories/album_repository.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repo;

  AlbumBloc(this.repo) : super(AlbumInitial()) {
    on<LoadAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await repo.fetchAlbums();
        final photos = await repo.fetchPhotos();
        emit(AlbumLoaded(albums, photos));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });
  }
}