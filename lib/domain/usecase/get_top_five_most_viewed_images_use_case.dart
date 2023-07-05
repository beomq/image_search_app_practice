import 'package:image_search_app_practice/domain/model/photo.dart';
import 'package:image_search_app_practice/domain/repository/photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  Future<List<Photo>> call(String query) async {
    final photos = await _repository.getPhotos(query);

    photos.sort((a, b) => b.views.compareTo(a.views));

    return photos.take(5).toList();
  }
}
