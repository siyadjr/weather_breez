import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weatherbreez/controller/home_screen_provider.dart';
import 'package:weatherbreez/controller/weather_provider.dart';
import 'package:weatherbreez/model/search_model.dart';
import 'package:weatherbreez/view/authentication/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Ensure adapter is registered before opening the box
  if (!Hive.isAdapterRegistered(0)) { // Using the actual typeId
    Hive.registerAdapter(SearchModelAdapter());
  }

  await Hive.openBox<SearchModel>('search_data');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'WeatherBreez',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
