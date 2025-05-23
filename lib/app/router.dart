import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/pages/album_list_page.dart';
import '../presentation/pages/album_detail_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AlbumListPage(),
    ),
    GoRoute(
      path: '/album/:id',
      builder: (context, state) {
        final id = int.parse(state.params['id']!);
        return AlbumDetailPage(albumId: id);
      },
    ),
  ],
);