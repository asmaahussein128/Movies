import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Controller/Api_Funcation_Popular.dart';
import 'package:movies/Controller/Api_Function.dart';
import 'package:movies/Conast.dart';
import 'package:movies/Viwes/Screens/Detials_Screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "NetFlix",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.red[800]),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: Colors.red[800],
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Consumer<Api>(
            builder: (context, ref, child) {
              return (ref.asmaa.isEmpty)
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : CarouselSlider.builder(
                      itemCount: ref.asmaa.length,
                      itemBuilder:
                          (BuildContext context, index, int pageViewIndex) {
                        return GestureDetector(onTap: (){


                            Navigator.push(context, CupertinoPageRoute(
                                builder: (BuildContext context) {
                                  return DetialsScreen(overview: ref.asmaa[index].overview,
                                      title: ref.asmaa[index].title,
                                      original_title: ref.asmaa[index].original_title,
                                      vote_average: ref.asmaa[index].vote_average,
                                      id:  ref.asmaa[index].id,
                                      backdrop_path:
                                      "${m.image_Url + ref.asmaa[index].backdrop_path}",
                                      poster_path:
                                      "${m.image_Url + ref.asmaa[index].poster_path}",
                                      release_date:
                                      "${ref.asmaa[index].release_date}");
                                }));


                        },
                          child: GridTile(
                              footer: Container(
                                height: 60,
                                alignment: Alignment.center,
                                color: Colors.red.withOpacity(0.5),
                                child: Text(
                                  ref.asmaa[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              child: Image.network(
                                "${m.image_Url + ref.asmaa[index].poster_path}",
                                fit: BoxFit.fill,
                              )),
                        );
                      },
                      options: CarouselOptions(
                        height: 300,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: Consumer<getpopulardata>(builder: (context, ref, child) {
            return (ref.asmaa.isEmpty)
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(
                              builder: (BuildContext context) {
                            return DetialsScreen(overview: ref.asmaa[index].overview,
                                title: ref.asmaa[index].title,
                                original_title: ref.asmaa[index].original_title,
                                vote_average: ref.asmaa[index].vote_average,
                                id:  ref.asmaa[index].id,
                                backdrop_path:
                                    "${m.image_Url + ref.asmaa[index].backdrop_path}",
                                poster_path:
                                    "${m.image_Url + ref.asmaa[index].poster_path}",
                                release_date:
                                    "${ref.asmaa[index].release_date}");
                          }));
                        },
                        child: Card(
                          color: Colors.red[800],
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 5, right: 5),
                            child: Column(
                              children: [
                                Image.network(
                                  "${m.image_Url + ref.asmaa[index].poster_path}",
                                  height: 140,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey, width: 4)),
                                  alignment: Alignment.center,
                                  child: Text(ref.asmaa[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red[800],
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: ref.asmaa.length,
                  );
          }))
        ],
      ),
    );
  }
}
