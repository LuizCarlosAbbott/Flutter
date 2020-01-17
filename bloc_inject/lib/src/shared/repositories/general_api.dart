import 'package:bloc_inject/src/shared/models/post.dart';
import 'package:dio/dio.dart';

import '../constants.dart';

class GeneralApi {
  //instancia do dio
  Dio dio;

  //contrutor do repositorio
  GeneralApi() {
    dio = Dio();
    dio.options.baseUrl = URL_API;
  }

  //metodo para pegar os posts da aplicação
  Future<List<Post>> getPosts() async {
    Response response = await dio.get("/posts");
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }
}
