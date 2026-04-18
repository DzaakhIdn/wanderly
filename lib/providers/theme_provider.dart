import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<bool> {
  static const String _themeBoxName = 'themeBox';
  static const String _isDarkKey = 'isDark';

  ThemeNotifier() : super(false) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final box = await Hive.openBox(_themeBoxName);
      final isDark = box.get(_isDarkKey, defaultValue: false) as bool;
      state = isDark;
    } catch (e) {
      print('Error loading theme: $e');
    }
  }

  Future<void> toggleTheme() async {
    state = !state;
    try {
      final box = await Hive.openBox(_themeBoxName);
      await box.put(_isDarkKey, state);
    } catch (e) {
      print('Error saving theme: $e');
    }
  }
}
