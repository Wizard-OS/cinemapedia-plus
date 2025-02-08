import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVDSGzgg7hv_7zlnV78ITXdEqLwZiETQGvos2ojIqIana6K2HTmOnY07vJU1F1eRfX7Qc&usqp=CAU',
        character: cast.character,
      );
}
