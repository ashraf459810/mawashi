class Language {
  String lanCode;
  String lanCountry;
  String langName;
  String emoji;

  Language({this.lanCode, this.lanCountry, this.langName, this.emoji});
}

List<Language> languages = [
  Language(lanCode: "en", lanCountry: "US", langName: "English", emoji: "🇺🇸"),
  Language(lanCode: "ar", lanCountry: "", langName: "العربية", emoji: "🇦🇪"),
  Language(lanCode: "de", lanCountry: "", langName: "Deutsche", emoji: "🇩🇪"),
  Language(lanCode: "hi", lanCountry: "", langName: "हिंदी", emoji: "🇮🇳"),
  Language(lanCode: "ja", lanCountry: "", langName: "日本語", emoji: "🇯🇵"),
  Language(lanCode: "tr", lanCountry: "", langName: "Türkçe", emoji: "🇹🇷"),
  Language(lanCode: "fr", lanCountry: "", langName: "Français", emoji: "🇫🇷"),
  Language(lanCode: "it", lanCountry: "", langName: "Italiano", emoji: "🇮🇹"),
  Language(lanCode: "el", lanCountry: "", langName: "Ελληνικά", emoji: "🇬🇷"),
  Language(lanCode: "he", lanCountry: "", langName: "עִברִית", emoji: "🇮🇱"),
  Language(lanCode: "es", lanCountry: "", langName: "Español", emoji: "🇪🇸"),
  Language(lanCode: "da", lanCountry: "", langName: "Dansk", emoji: "🇩🇰"),
];
