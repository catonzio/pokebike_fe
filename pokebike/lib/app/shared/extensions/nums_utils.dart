extension IntUtils on int {
  bool inRange({int? lb, int? ub, bool lbe = false, bool ube = true}) {
    bool lbc = true;
    bool ubc = true;

    if (lb != null) {
      if (lbe) {
        lbc = lb <= this;
      } else {
        lbc = lb < this;
      }
    }
    if (ub != null) {
      if (ube) {
        ubc = this <= ub;
      } else {
        ubc = this < ub;
      }
    }

    return lbc && ubc;
  }
}

extension DoubleUtils on double {
  bool inRange({double? lb, double? ub, bool lbe = false, bool ube = true}) {
    bool lbc = true;
    bool ubc = true;

    if (lb != null) {
      if (lbe) {
        lbc = lb <= this;
      } else {
        lbc = lb < this;
      }
    }
    if (ub != null) {
      if (ube) {
        ubc = this <= ub;
      } else {
        ubc = this < ub;
      }
    }

    return lbc && ubc;
  }
}
