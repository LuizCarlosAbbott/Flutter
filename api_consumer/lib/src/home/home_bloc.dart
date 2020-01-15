import 'package:api_consumer/src/home/home_service.dart';
import 'package:rxdart/rxdart.dart';

import 'model/post.dart';

class HomeBloc {
  HomeService service = HomeService();

  final BehaviorSubject<bool> _listController =
      BehaviorSubject<bool>(seedValue: true);
  Sink<bool> get listIn => _listController.sink;
  Observable<List<Post>> listOut;

  HomeBloc() {
    listOut = _listController.stream.asyncMap((d) => service.getPosts());
  }

  dispose() {
    _listController.close();
  }
}
