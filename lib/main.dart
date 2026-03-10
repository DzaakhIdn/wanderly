import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wanderly_app/models/trip.dart';
import 'package:wanderly_app/screens/auth/signin_form_screen.dart';
import 'package:wanderly_app/screens/auth/signin_screen.dart';
import 'package:wanderly_app/screens/auth/signup_form_screen.dart';
import 'package:wanderly_app/screens/auth/signup_screen.dart';
import 'package:wanderly_app/screens/home_screen.dart';
import 'package:wanderly_app/screens/onbboarding_screen.dart';
import 'package:wanderly_app/screens/saved_trip_screen.dart';
import 'package:wanderly_app/screens/discover_all_trips_screen.dart';
import 'package:wanderly_app/screens/trip_detail.dart';
import 'package:wanderly_app/screens/user_profile_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentsDir = await getApplicationDocumentsDirectory();
  Hive.init(documentsDir.path);
  Hive.registerAdapter(MyTripAdapter());
  await Hive.openBox<MyTrip>("myTrips");
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: Onbboarding.routName,
      routes: {
        Onbboarding.routName: (context) => Onbboarding(),
        SigninScreen.routeName: (context) => SigninScreen(),
        SigninFormScreen.routeName: (conext) => SigninFormScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        SignupFormScreen.routeName: (context) => SignupFormScreen(),
        SavedTripScreen.routName: (context) => SavedTripScreen(),
        DiscoverAllTripsScreen.routeName: (context) => DiscoverAllTripsScreen(),
        UserProfileScreen.routeName: (context) => UserProfileScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == TripDetailScreen.routeName) {
          final tripId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => TripDetailScreen(tripId: tripId),
          );
        }
        return null;
      },
    );
  }
}
