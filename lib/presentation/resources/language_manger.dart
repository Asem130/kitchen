enum LanguageType {
  Arabic,
  english,
}

const String arabic = "ar";
const english = "en";

extension LanguageTypeExtention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.Arabic:
        return arabic;
      case LanguageType.english:
        return english;
    }
  }
}
