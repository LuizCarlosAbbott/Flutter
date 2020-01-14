import 'package:git_search/home/github_service.dart';
import 'package:git_search/models/search_result.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final GithubService _githubService = GithubService();

  final BehaviorSubject<String> _searchController = BehaviorSubject<String>();

  Observable<String> get searchFlux => _searchController.stream;

  Sink<String> get searchEvent => _searchController.sink;

  Observable<SearchResult> listItems;

  HomeBloc() {
    listItems = searchFlux
        .distinct()
        .debounce(Duration(milliseconds: 300))
        .asyncMap(_githubService.search)
        .switchMap((dados) => Observable.just(dados));
  }

  void dispose() {
    _searchController?.close();
  }
}
