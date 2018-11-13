abstract class TypedAction {
  String get type;
}

class SetLoading implements TypedAction {
  final bool isLoading;
  final String type;
  SetLoading({this.type, this.isLoading});
}

class SetPageNumber implements TypedAction {
  final String type;
  final int number;
  SetPageNumber({this.type, this.number});
}

class SetHaveReachedEnd implements TypedAction {
  final String type;
  final bool haveReachedEnd;
  SetHaveReachedEnd({this.type, this.haveReachedEnd});
}
