import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:movies/Models/Movie.dart';
import 'package:http/http.dart' as http;

class getpopulardata extends ChangeNotifier {
  List<Movie> asmaa = [];

  Future getdata() async {
    try {
      final String apikey = "3c249895051780e19359f5d79dab9e1b";
      var urL = Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=${apikey}&language=en-US');
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

        notifyListeners();
      }
      notifyListeners();
      return asmaa;
    } catch (e) {
      print("error=>$e");
    }
  }
}