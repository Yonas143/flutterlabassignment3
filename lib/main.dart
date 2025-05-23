import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/router.dart';
import 'data/repositories/album_repository.dart';
import 'presentation/blocs/album_bloc.dart';
import 'presentation/blocs/album_event.dart';

void main() {
  final repo = AlbumRepository();
  runApp(MyApp(repo: repo));
}

class MyApp extends StatelessWidget {
  final AlbumRepository repo;

  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Albums App',
      theme: ThemeData(primarySwatch: Colors.blue),
      builder: (context, child) {
        return BlocProvider(
          create: (_) => AlbumBloc(repo)..add(LoadAlbums()),
          child: child!,
        );
      },
    );
  }
}