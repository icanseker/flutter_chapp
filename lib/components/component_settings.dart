class ComponentSettings {
  static final double _sizeCoefficient = 5;
  double sizeRatioAmount = 10;

  /* expected -1.0 <= coefficient = 0.0 <= 1.0 */
  ComponentSettings({double sizeRatio = 0.0}) {
    if (sizeRatio == null)
      sizeRatio = 0.0;
    else if (sizeRatio > 1.0)
      sizeRatio = 1.0;
    else if (sizeRatio < -1.0) sizeRatio = -1.0;

    this.sizeRatioAmount += _sizeCoefficient * sizeRatio;
  }
}
