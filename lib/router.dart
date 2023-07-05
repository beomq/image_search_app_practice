import 'package:go_router/go_router.dart';
import 'package:image_search_app_practice/data/repository/pixabay_photo_repository_impl.dart';
import 'package:image_search_app_practice/domain/model/photo.dart';
import 'package:image_search_app_practice/domain/usecase/get_top_five_most_viewed_images_use_case.dart';
import 'package:image_search_app_practice/presentation//detail/detail_screen.dart';
import 'package:image_search_app_practice/presentation//main/main_screen.dart';
import 'package:image_search_app_practice/presentation//main/main_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(
            GetTopFiveMostViewedImagesUseCase(
              PixabayPhotoRepositoryImpl(),
            ),
          ),
          child: const MainScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            final photo = state.extra as Photo;
            return DetailScreen(photo: photo);
          },
        ),
      ],
    ),
  ],
);
