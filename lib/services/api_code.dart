import 'dart:convert';
import 'package:http/http.dart';

class numberTrivia {
  String fact;
  String url;

  numberTrivia({this.fact, this.url});
  Future<numberTrivia> fetchAlbum() async {
    Response response = await get(Uri.http('numbersapi.com', 'random/$url'));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
