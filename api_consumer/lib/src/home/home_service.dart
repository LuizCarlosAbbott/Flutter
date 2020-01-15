import 'package:api_consumer/utils/constants.dart';
import 'package:dio/dio.dart';
import 'model/post.dart';

class HomeService {
  Dio dio = Dio();

  Future<List<Post>> getPosts() async {
    Response response = await dio.get("$URL_API/posts");
    if (response.statusCode == 200) {
      List<Post> posts =
          (response.data as List).map((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      Exception("Erro na requisição");
    }
  }

  Future<Post> getPost(int id) async {
    Response response = await dio.get("$URL_API/posts/$id");
    if (response.statusCode == 200) {
      return Post.fromJson(response.data);
    } else {
      Exception("Erro na requisição");
    }
  }
}
