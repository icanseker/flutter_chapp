enum GeneralContentSize {
  smallest,
  extra_small,
  smaller,
  standard,
  little_bigger,
  bigger,
  extra_big,
  biggest,
}

extension ContentSizeDeviation on GeneralContentSize {
  double get deviation {
    switch (this) {
      case GeneralContentSize.little_bigger:
        return 1.0;
      case GeneralContentSize.bigger:
        return 2.0;
      case GeneralContentSize.extra_big:
        return 4.0;
      case GeneralContentSize.biggest:
        return 6.0;
      case GeneralContentSize.smaller:
        return -2.0;
      case GeneralContentSize.extra_small:
        return -3.0;
      case GeneralContentSize.smallest:
        return -4.0;
      case GeneralContentSize.standard:
      default:
        return 0.0;
    }
  }
}
