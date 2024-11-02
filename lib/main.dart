import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/config/theme/dark/theme.dart';
import 'package:rolanda_modified_version/config/theme/light/theme.dart';
import 'package:rolanda_modified_version/providers/login_provider.dart';
import 'package:rolanda_modified_version/providers/language_provider.dart';
import 'package:rolanda_modified_version/providers/theme_provider.dart';
import 'package:rolanda_modified_version/repository/login_repository.dart';
import 'package:rolanda_modified_version/routes/route_generator.dart';
import 'package:rolanda_modified_version/routes/routes.dart';
import 'package:rolanda_modified_version/service_impl/login_service_impl.dart';
import 'package:rolanda_modified_version/utils/preferences_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final preferencesService = PreferencesService();
late Size screenSize;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(
            LoginRepository(
              LoginServiceImpl(baseUrl),
            ),
          ),
        ),
      ],
      child: const MyApp(
        initialRoute: Routes.welcome,
      )));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      title: 'Rolanda App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: LightTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      themeMode: themeProvider.currentTheme,
      locale: languageProvider.currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
