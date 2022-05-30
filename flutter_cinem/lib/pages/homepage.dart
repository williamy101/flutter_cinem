import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinem/bloc/moviebloc/movie_bloc.dart';
import 'package:flutter_cinem/model/movie.dart';
import 'package:flutter_cinem/pages/detailspage.dart';
import 'package:flutter_cinem/widgets/widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? value = 'Surabaya';
  final items = ['Surabaya', 'Malang', 'Jakarta', 'Bandung'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 82, 87),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 82, 87),
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            'Hello William',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 15, right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          )
        ],
        flexibleSpace: Container(
          margin: const EdgeInsets.only(top: 50, left: 20),
          child: Row(children: <Widget>[
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 6,
                child: Container(
                  height: 20,
                  width: 100,
                  child: DropdownButton<String>(
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                    selectedItemBuilder: (BuildContext context) {
                      return items.map((String value) {
                        return Text(
                          value,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        );
                      }).toList();
                    },
                    value: value,
                    iconSize: 24,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                ))
          ]),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: InkWell(
              onTap: () {},
              child: Container(
                  height: 30,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  //  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromARGB(255, 49, 82, 87),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          Icon(Icons.search,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          Expanded(
                            child: Text(
                              "Search Movies",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            )),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        children: [
          SizedBox(height: 20.0),
          _ItemTitle(title: 'Playing Now'),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 280,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: MovieModel.listMovie.length,
              itemBuilder: (context, i) =>
                  _ItemsNowCinemas(movieModel: MovieModel.listMovie[i]),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildBody(BuildContext context) {
  //   return LayoutBuilder(
  //       builder: (BuildContext context, BoxConstraints constraints) {
  //     return SingleChildScrollView(
  //       child: ConstrainedBox(
  //         constraints: BoxConstraints(minHeight: constraints.maxHeight),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {

  //             })
  //           ],
  //         ),
  //       ),
  //     );
  //   });
  // }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
      );
}

class _ItemTitle extends StatelessWidget {
  final String title;

  const _ItemTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: title,
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}

class _ItemsNowCinemas extends StatelessWidget {
  final MovieModel movieModel;

  const _ItemsNowCinemas({Key? key, required this.movieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailsPage(movieModel: movieModel))),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'movie-hero-${movieModel.id}',
              child: Container(
                height: 210,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(movieModel.image))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
