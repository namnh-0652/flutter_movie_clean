import 'package:flutter_movie_clean/moviedetails/data/cast.dart';
import 'package:flutter_movie_clean/moviedetails/data/more.dart';
import 'package:flutter_movie_clean/moviedetails/data/movie.dart';

import '../../generated/assets.gen.dart';

class MovieDetailsState {
  MovieDetailsState();

  final movieDetails = Movie(
    1,
    'Ant-Man and The Wasp Quantumania',
    'Super Hero partners Scott Lang and Hope Van Dyne return to continue their adventures as Ant-Man and The Wasp. Together, with Hope’s parents Hank Pym and Janet Van Dyne, the family finds themselves exploring the Quantum Realm, interacting with strange new creatures, and embarking on an adventure that will push them beyond the limits of what they thought was possible.',
    Assets.images.moviedetails.details2.path,
    [
      Cast(1, 'Paul Bettany', 'vision', Assets.images.casts.casts1.path),
      Cast(2, 'Elizabeth Olsen', 'Wanda Maximoff', Assets.images.casts.casts2.path),
      Cast(3, 'Kathryn Hahn', 'Agnes', Assets.images.casts.casts3.path),
      Cast(4, 'Teyonah Parris', 'Monica Rambeau', Assets.images.casts.casts4.path),
      Cast(5, 'Kat Dennings', 'Darcy Lewis', Assets.images.casts.casts5.path),
      Cast(6, 'Randall Park', 'Jimmy Woo', Assets.images.casts.casts6.path)
    ],
    [
      More(1, 'Avengers: Age of Ultron', '2015', Assets.images.mores.mores1.path),
      More(2, 'Avengers: Endgame', '2019', Assets.images.mores.mores2.path)
    ],
    Assets.images.moviedetails.details2.path,
    Assets.images.trailers.trailers1.path,
  );
}
