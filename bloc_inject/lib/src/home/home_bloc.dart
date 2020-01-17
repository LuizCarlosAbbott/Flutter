import 'package:bloc_inject/src/shared/models/post.dart';
import 'package:bloc_inject/src/shared/repositories/general_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase {
  final GeneralApi api;

  HomeBloc(this.api);

  final BehaviorSubject _listController = BehaviorSubject.seeded(true);

  Sink get listIn => _listController.sink;

  // Observa<List<Post>> get listOut =>
  //     _listController.stream.asyncMap((v) => api.getPosts());

  @override
  void dispose() {
    _listController.close();
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }
}
