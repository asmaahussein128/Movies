import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:movies/Models/Movie.dart';
import 'package:http/http.dart' as http;

class Api with ChangeNotifier {
  List<Movie> asmaa = [];

  Future getdata() async {
    try {
      final String apikey = "3c249895051780e19359f5d79dab9e1b";
      var urL = Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=${apikey}&language=en-US');
      var response = await http.get(urL);
      var responsebody = jsonDecode(response.body)["results"];
      for (var I in responsebody) {
        Movie x = Movie(overview:  I["overview"],
            title: I["title"],
            original_title: I["original_title"],
            vote_average: I["vote_average"],
            id: I["id"],
            backdrop_path: I["backdrop_path"],
            poster_path: I["poster_path"],
            release_date: I["release_date"]);
        asmaa.add(x);
        notifyListeners();
      }
      notifyListeners();
      return asmaa;
    } catch (e) {
      print("error=>$e");
    }
  }
}

class Apinormal {
  static String apikey = "3c249895051780e19359f5d79dab9e1b";

  static Future<List<Movie>> fetchMovie() async {
    List<Movie> asmaa = [];
    var urL = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${apikey}&language=en-US');
    print(urL);
    var response = await http.get(urL);
    var responsebody = jsonDecode(response.body)["results"];
    for (var index in responsebody) {
      Movie x = Movie(overview:  index["overview"],
          title: index["title"],
          original_title: index["original_title"],
          vote_average: index["vote_average"],
          id: index["id"],
          backdrop_path: index["backdrop_path"],
          poster_path: index["poster_path"],
          release_date: index["release_date"]);
      asmaa.add(x);
    }
    return asmaa;
  }
}
