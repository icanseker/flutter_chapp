enum GeneralContentSize {
  x6_small,
  x5_small,
  x4_small,
  x3_small,
  x2_small,
  x_small,
  small,
  standard,
  large,
  x_large,
  x2_large,
  x3_large,
  x4_large,
  x5_large,
  x6_large,
}

extension ContentSizeCoefficient on GeneralContentSize {
  double get sizeRatio {
    switch (this) {
      case GeneralContentSize.small:
        return -0.1;
      case GeneralContentSize.x_small:
        return -0.2;
      case GeneralContentSize.x2_small:
        return -0.3;
      case GeneralContentSize.x3_small:
        return -0.4;
      case GeneralContentSize.x4_small:
        return -0.5;
      case GeneralContentSize.x5_small:
        return -0.6;
      case GeneralContentSize.x6_small:
        return -0.7;
      case GeneralContentSize.large:
        return 0.1;
      case GeneralContentSize.x_large:
        return 0.2;
      case GeneralContentSize.x2_large:
        return 0.3;
      case GeneralContentSize.x3_large:
        return 0.4;
      case GeneralContentSize.x4_large:
        return 0.5;
      case GeneralContentSize.x5_large:
        return 0.6;
      case GeneralContentSize.x6_large:
        return 0.7;
      case GeneralContentSize.standard:
      default:
        return 0.0;
    }
  }
}
