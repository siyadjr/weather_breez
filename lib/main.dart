import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weatherbreez/controller/home_screen_provider.dart';
import 'package:weatherbreez/controller/weather_provider.dart';
import 'package:weatherbreez/localization/local.dart';
import 'package:weatherbreez/model/search_model.dart';
import 'package:weatherbreez/view/authentication/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Initialize localization
  await FlutterLocalization.instance.ensureInitialized();

  // Ensure adapter is registered before opening the box
  if (!Hive.isAdapterRegistered(0)) {
    // Using the actual typeId
    Hive.registerAdapter(SearchModelAdapter());
  }

  await Hive.openBox<SearchModel>('search_data');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    configureLocalization();
  }

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
      child: MaterialApp(
        title: 'WeatherBreez',
        debugShowCheckedModeBanner: false,
        supportedLocales: localization.supportedLocales.isEmpty
            ? [const Locale('en', 'US')]
            : localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,
        home: SplashScreen(),
      ),
    );
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: 'ml');
    localization.onTranslatedLanguage = onTransalatedLanguage;
  }

  void onTransalatedLanguage(Locale? local) {
    setState(() {});
  }
}
