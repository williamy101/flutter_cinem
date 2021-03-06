// ignore_for_file: unnecessary_const

// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinem/model/movie.dart';
import 'package:flutter_cinem/pages/detailspage.dart';
import 'package:flutter_cinem/widgets/customText.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? value = 'Surabaya';
  final items = ['Surabaya', 'Malang', 'Jakarta', 'Bandung'];
  final List promos = [
    {
      'url': 'https://promo.tix.id/images/Banner-buy.png',
    },
    {
      'url': 'https://promo.tix.id/images/cashback_juni.jpg',
    },
    {
      'url': 'https://img.pilihkartu.com/Promo/Banner-promo-kseghf.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 33, 35),
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 22, 33, 35),
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text(
            'Hello William',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 30, right: 30),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          )
        ],
        flexibleSpace: Container(
          margin: const EdgeInsets.only(top: 90, left: 20),
          child: Row(children: <Widget>[
            Flexible(
              flex: 1,
              child: Row(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 6,
                child: SizedBox(
                  height: 20,
                  width: 100,
                  child: DropdownButton<String>(
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    style: const TextStyle(
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
                    icon: const Icon(
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
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: InkWell(
              onTap: () {},
              child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                  //  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromARGB(255, 121, 171, 179),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color.fromARGB(255, 62, 91, 95),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          Icon(Icons.search,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          Expanded(
                            child: Text(
                              "Search Movies",
                              style: TextStyle(
                                color: Color.fromARGB(255, 121, 171, 179),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            const _ItemTitle(title: 'Playing Now'),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              height: 230,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  initialPage: 1,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                itemCount: MovieModel.listMovie.length,
                itemBuilder: (context, i) =>
                    _ItemsNowPlaying(movieModel: MovieModel.listMovie[i]),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const _ItemTitle(title: 'Promo'),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                initialPage: 1,
                enableInfiniteScroll: false,
                height: 120,
              ),
              items: promos.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item['url'],
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            )
          ],
        ),
        // physics: const BouncingScrollPhysics(),
        // padding: const EdgeInsets.symmetric(vertical: 10.0),
        // children: [
        //   const SizedBox(height: 20.0),
        //   const _ItemTitle(title: 'Playing Now'),
        //   Container(
        //     margin: const EdgeInsets.only(left: 20.0),
        //     height: 230,
        //     child: CarouselSlider.builder(
        //       options: CarouselOptions(
        //         autoPlay: true,
        //         autoPlayInterval: const Duration(seconds: 5),
        //         autoPlayAnimationDuration: const Duration(milliseconds: 500),
        //         initialPage: 1,
        //         enlargeCenterPage: true,
        //         enableInfiniteScroll: false,
        //       ),
        //       itemCount: MovieModel.listMovie.length,
        //       itemBuilder: (context, i) =>
        //           _ItemsNowPlaying(movieModel: MovieModel.listMovie[i]),
        //     ),
        //   ),
        //   const SizedBox(
        //     height: 20.0,
        //   ),
        //   const _ItemTitle(title: 'Promo'),
        //   Column(
        //     children: [
        //       CarouselSlider(
        //         options: CarouselOptions(
        //           autoPlay: true,
        //           autoPlayInterval: const Duration(seconds: 5),
        //           autoPlayAnimationDuration: const Duration(milliseconds: 500),
        //           initialPage: 1,
        //           enableInfiniteScroll: false,
        //           height: 120,
        //         ),
        //         items: promos.map((item) {
        //           return ClipRRect(
        //             borderRadius: BorderRadius.circular(10),
        //             child: Image.network(
        //               item['url'],
        //               fit: BoxFit.cover,
        //             ),
        //           );
        //         }).toList(),
        //       ),
        //     ],
        //   )
        // ],
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
          style: const TextStyle(
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
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}

class _ItemsNowPlaying extends StatelessWidget {
  final MovieModel movieModel;

  const _ItemsNowPlaying({Key? key, required this.movieModel})
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
                height: 230,
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
