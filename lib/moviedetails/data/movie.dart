import 'cast.dart';
import 'more.dart';

class Movie {
  final int id;
  final String name;
  final String poster;
  final String content;
  final String trailer;
  final String trailerImage;
  final List<Cast> casts;
  final List<More> mores;

  Movie(
    this.id,
    this.name,
    this.content,
    this.trailer,
    this.casts,
    this.mores,
    this.poster,
    this.trailerImage,
  );
}
