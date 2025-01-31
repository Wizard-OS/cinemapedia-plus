import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import '../../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    if (slideShowMovies.isEmpty) return CircularProgressIndicator();

    return Column(
      children: [
        CustomAppbar(),
        MoviesSlideshow(movies: slideShowMovies),
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En cines',
          subtitle: 'Lunes',
          loadNextPage: ()=>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
        )

        // Expanded(
        //   child: ListView.builder( 
        //     itemCount: nowPlayingMovies.length,
        //     itemBuilder: (context, index) {
        //       final movie = nowPlayingMovies[index];
        //       return ListTile(
        //         title: Text(movie.title),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
