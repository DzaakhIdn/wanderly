# Cara Menggunakan Theme Switcher

## 1. Import di Screen/Widget
```dart
import 'package:wanderly_app/widgets/theme_switcher.dart';
import 'package:wanderly_app/theme/app_colors.dart';
```

## 2. Tambah ThemeSwitcher di AppBar atau Header
```dart
AppBar(
  title: Text('Home'),
  actions: [
    ThemeSwitcher(), // Tombol switch theme
  ],
)
```

## 3. Gunakan AppColors.of() untuk warna yang responsive
```dart
// Daripada hardcode warna:
backgroundColor: Color(0xFFFFFFFF), // ❌ Tidak responsive

// Gunakan:
backgroundColor: AppColors.of(context).background, // ✅ Responsive
textColor: AppColors.of(context).textPrimary,
```

## 4. Contoh Lengkap di Widget
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    
    return Container(
      color: colors.background,
      child: Column(
        children: [
          Text(
            'Hello',
            style: TextStyle(color: colors.textPrimary),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Click me'),
          ),
        ],
      ),
    );
  }
}
```

## 5. Warna yang Tersedia
- `background` - Background utama
- `surface` - Surface/card background
- `textPrimary` - Text utama
- `textSecondary` - Text secondary
- `primary` - Warna primary (biru)
- `secondary` - Warna secondary (kuning)
- `divider` - Garis pembatas
- `shadow` - Shadow
- `onPrimary` - Text di atas primary color
- `success` - Warna sukses (hijau)
- `error` - Warna error (merah)

## 6. Contoh Update HomeScreen
```dart
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.surface,
        title: Text('Home', style: TextStyle(color: colors.textPrimary)),
        actions: [
          ThemeSwitcher(),
        ],
      ),
      body: Column(
        children: [
          Text('Halo Cuy!', style: TextStyle(color: colors.textPrimary)),
          // ... rest of content
        ],
      ),
    );
  }
}
```
