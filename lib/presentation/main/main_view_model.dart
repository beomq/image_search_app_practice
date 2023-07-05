import 'package:flutter/material.dart';
import 'package:image_search_app_practice/domain/repository/photo_repository.dart';
import 'package:image_search_app_practice/domain/usecase/get_top_five_most_viewed_images_use_case.dart';
import 'package:image_search_app_practice/presentation/main/main_state.dart';

class MainViewModel extends ChangeNotifier {
  GetTopFiveMostViewedImagesUseCase _getTopFiveMostViewedImagesUseCase;
  MainViewModel(this._getTopFiveMostViewedImagesUseCase);

  MainState _state = const MainState();
  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
        isLoading: false,
        photos: await _getTopFiveMostViewedImagesUseCase(query));
    notifyListeners();
  }
}