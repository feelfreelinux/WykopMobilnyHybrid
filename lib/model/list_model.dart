import 'package:owmflutter/model/base_model.dart';

typedef Future<List<T>> LoadNewItemsCallback<T>(int page);
typedef D ItemToModelMapper<T, D>(T item);

class ListModel<T, D> extends BaseModel {
  final LoadNewItemsCallback<T> loadNewItems;
  final ItemToModelMapper<T, D> mapper;

  ListModel({this.loadNewItems, this.mapper}) {
    loadMoreItems();
  }

  List<D> _items = [];
  bool _haveReachedEnd = false;
  bool _isLoading = false;
  int _page = 1;

  List<D> get items => _items;
  bool get haveReachedEnd => _haveReachedEnd;
  bool get isLoading => _isLoading && _page == 1;

  Future<void> refresh() => scheduleFuture(_refresh());

  Future<void> _refresh() async {
    _page = 1;
    _isLoading = true;
    notifyListeners();
    _items = (await loadNewItems(_page)).map((e) => mapper(e)).toList();
    if (_items.isEmpty) {
      _haveReachedEnd = true;
    }
    _isLoading = false;
    _page += 1;
    notifyListeners();
  }

  Future<void> loadMoreItems() => scheduleFuture(_loadMoreItems());

  Future<void> _loadMoreItems() async {
    if (!_isLoading && !_haveReachedEnd) {
      _isLoading = true;
      notifyListeners();
      var loadedItems = await loadNewItems(_page);
      _items.addAll(loadedItems.map((e) => mapper(e)).toList());
      if (loadedItems.isEmpty) {
        _haveReachedEnd = true;
      }
      _isLoading = false;
      _page += 1;
      notifyListeners();
    }
  }
}
