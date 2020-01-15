import 'package:api_consumer/src/home/home_service.dart';
import 'package:api_consumer/src/home/model/post.dart';
import 'package:api_consumer/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientMockito extends Mock implements Dio {}

void main() {
  group("HomeService", () {
    test("teste de service deu ok", () async {
      HomeService service = HomeService();
      service.dio = ClientMockito();

      when(service.dio.get("${URL_API}/posts/1")).thenAnswer((_) async =>
          Response(statusCode: 200, data: {"id": 1, "title": "test"}));

      expect(await service.getPost(1), isInstanceOf<Post>());
    });

    test("teste de service deu erro", () async {
      HomeService service = HomeService();
      service.dio = ClientMockito();

      when(service.dio.get("${URL_API}/posts/1")).thenAnswer(
          (_) async => Response(statusCode: 404, data: "Not Found"));

      expect(service.getPost(1), throwsException);
    });
  });
}
