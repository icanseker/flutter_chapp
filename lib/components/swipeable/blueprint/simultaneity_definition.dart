class SwipeSimultaneityController {
  int _maxSimultaneouslySwipedObj;
  int _swipingCurrently = 0;

  SwipeSimultaneityController({int maxSimultaneouslySwipedObj = -1}) {
    if (maxSimultaneouslySwipedObj < -1)
      _maxSimultaneouslySwipedObj = -1;
    else
      _maxSimultaneouslySwipedObj = maxSimultaneouslySwipedObj;
  }

  bool get isSwipeAllowed {
    if (_maxSimultaneouslySwipedObj == -1 ||
        _swipingCurrently < _maxSimultaneouslySwipedObj) {
      _swipingCurrently++;
      return true;
    }

    return false;
  }

  void swipeFinished() => _swipingCurrently--;
}
