enum LanguageType {
  english,
  filipino,
}

const String english = "en";
const String filipino = "ph";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.filipino:
        return filipino;
    }
  }
}
