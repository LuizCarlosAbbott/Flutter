import 'package:bloc_inject/src/shared/models/post.dart';
import 'package:bloc_inject/src/shared/repositories/general_api.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  var api = GeneralApi();

  test('getPosts', () async {
    List<Post> data = await api.getPosts();
    expect(data[0].id, 1);
  });
}
