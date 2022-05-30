import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinem/bloc/moviebloc/movie_bloc.dart';
import 'package:flutter_cinem/model/movie.dart';
import 'package:flutter_cinem/widgets/customText.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatelessWidget {
  final MovieModel movieModel;

  const DetailsPage({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final movieBloc = BlocProvider.of<MovieBloc>(context);

    return Scaffold(
        // body: ,
        );
  }
}
