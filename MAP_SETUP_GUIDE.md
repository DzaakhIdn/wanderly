# Google Maps Setup Guide

## 1. Get Google Maps API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create new project or select existing
3. Enable these APIs:
   - Maps SDK for Android
   - Maps SDK for iOS
   - Geolocation API

4. Create API Key:
   - Go to Credentials
   - Click "Create Credentials" → "API Key"
   - Copy the key

## 2. Android Setup

Edit `android/app/src/main/AndroidManifest.xml`:

```xml
<manifest ...>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    
    <application ...>
        <meta-data
            android:name="com.google.android.geo.API_KEY"
            android:value="YOUR_API_KEY_HERE"/>
    </application>
</manifest>
```

## 3. iOS Setup

Edit `ios/Runner/Info.plist`:

```xml
<dict>
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs your location to show it on the map</string>
    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
    <string>This app needs your location to show it on the map</string>
    <key>com.google.ios.maps.API_KEY</key>
    <string>YOUR_API_KEY_HERE</string>
</dict>
```

## 4. Usage

```dart
import 'package:wanderly_app/screens/map_screen.dart';

// Navigate to map
Navigator.pushNamed(context, MapScreen.routeName);

// Or with markers
Navigator.pushNamed(
  context,
  MapScreen.routeName,
  arguments: [
    MapMarkerData(
      id: '1',
      latitude: -6.2088,
      longitude: 106.8456,
      title: 'Jakarta',
      snippet: 'Capital of Indonesia',
    ),
  ],
);
```

## 5. Permissions

The app will request location permissions at runtime. Make sure to handle permission requests properly.
