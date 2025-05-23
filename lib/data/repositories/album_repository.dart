import '../../core/network/http_client.dart';
import '../models/album_model.dart';
import '../models/photo_model.dart';
import 'dart:convert';

class AlbumRepository {
  final HttpClient _client = HttpClient();

  Future<List<AlbumModel>> fetchAlbums() async {
    final res = await _client.get('https://jsonplaceholder.typicode.com/albums');
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((json) => AlbumModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  Future<List<PhotoModel>> fetchPhotos() async {
    final res = await _client.get('https://jsonplaceholder.typicode.com/photos');
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}