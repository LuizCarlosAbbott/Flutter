import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
// import 'package:dio/dio.dart';

class AppRepository extends Disposable {
  // Future fetchPost(Dio client) async {
  //   final response =
  //       await client.get('https://jsonplaceholder.typicode.com/posts/1');
  //   return response.data;
  // }
  final HasuraConnect connection;

  AppRepository(this.connection);

  getUser(String user) {
    var a = """
  }

  @override
  void dispose() {}
}
