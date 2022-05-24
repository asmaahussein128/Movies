import 'dart:ui';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetialsScreen extends StatefulWidget {
  int id;
  String title;
  String original_title;
  num vote_average;
  String poster_path;
  String backdrop_path;
  String release_date;
  String overview;

  DetialsScreen(
      {required this.overview,
      required this.title,
      required this.original_title,
      required this.vote_average,
      required this.id,
      required this.backdrop_path,
      required this.poster_path,
      required this.release_date});

  @override
  State<DetialsScreen> createState() => _DetialsScreenState();
}

class _DetialsScreenState extends State<DetialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Transform(
              transform: Matrix4.rotationY(0),
              child: Image.network(
                widget.poster_path,
                fit: BoxFit.fill,
              )),
          BackdropFilter(
              child: Container(
                color: Colors.teal.withOpacity(0.1),
              ),
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4)),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 33,
                        ),
                        label: Text(
                          "Back",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                Stack(children: [
                  FlipCard(
                  //fill: Fill.fillFront,
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.poster_path))),
                  ),
                  back: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.backdrop_path))),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(alignment: Alignment.topRight,
                      child: Material(
                          color: Colors.red.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                          child: MaterialButton(
                              onPressed: (){},
                              child:Text("Watch on EgyPest",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),))),
                    ),
                )],)
                  ,SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(alignment: Alignment.centerLeft,height: 60,width: 250,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "vote : ${widget.vote_average}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 350,
                      width: 400,
                      child: Text(
                        widget.overview,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
