import 'package:image_search_app_practice/data/dto/pixabay_result_dto.dart';
import 'package:image_search_app_practice/domain/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id ?? 0,
      url: webformatURL ?? '',
      tags: tags ?? '',
      views: views ?? 0,
    );
  }
}
