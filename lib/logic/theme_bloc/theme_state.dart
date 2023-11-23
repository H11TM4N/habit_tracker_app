// ignore_for_file: public_member_api_docs, sort_constructors_first
class ThemeState {
  final bool isDarkMode;

  ThemeState({
    this.isDarkMode = false,
  });

  ThemeState copyWith({
    bool? isDarkMode,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
