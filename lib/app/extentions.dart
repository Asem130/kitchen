extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else
      return this!;
  }
}

extension NonNullIntger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else
      return this!;
  }
}
