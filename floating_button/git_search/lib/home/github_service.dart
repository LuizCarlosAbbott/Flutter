import 'package:dio/dio.dart';
import 'package:git_search/models/search_result.dart';

class GithubService {

  final dio = Dio();

  Future search(String text) async {
    Response response =
      await dio.get("https://api.github.com/search/repositories?q=${text}");
    print(response.data);
    return SearchResult.fromJson(response.data);
  }
}