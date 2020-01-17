import 'package:bloc_inject/src/home/home_bloc.dart';
import 'package:bloc_inject/src/shared/models/post.dart';
import 'package:bloc_inject/src/shared/repositories/general_api.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  var bloc = HomeBloc(GeneralApi());

  // test('Teste if completed list', () {
  //   bloc.listIn.add(true);

  //   expect(bloc.listOut, emits(List<Post>()));
  // }, skip: true);
}
