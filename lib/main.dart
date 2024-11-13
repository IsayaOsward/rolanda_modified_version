import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/config/theme/dark/theme.dart';
import 'package:rolanda_modified_version/config/theme/light/theme.dart';
import 'package:rolanda_modified_version/providers/add_to_selection_provider.dart';
import 'package:rolanda_modified_version/providers/booking_provider.dart';
import 'package:rolanda_modified_version/providers/check_availability_provider.dart';
import 'package:rolanda_modified_version/providers/contact_provider.dart';
import 'package:rolanda_modified_version/providers/hotels_provider.dart';
import 'package:rolanda_modified_version/providers/login_provider.dart';
import 'package:rolanda_modified_version/providers/language_provider.dart';
import 'package:rolanda_modified_version/providers/theme_provider.dart';
import 'package:rolanda_modified_version/repository/contact_repository.dart';
import 'package:rolanda_modified_version/repository/login_repository.dart';
import 'package:rolanda_modified_version/routes/route_generator.dart';
import 'package:rolanda_modified_version/routes/routes.dart';
import 'package:rolanda_modified_version/service_impl/booking_service_impl.dart';
import 'package:rolanda_modified_version/service_impl/contact_service_impl.dart';
import 'package:rolanda_modified_version/service_impl/login_service_impl.dart';
import 'package:rolanda_modified_version/services/confirm_booking_service.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/preferences_service.dart';

import 'providers/fetch_booking_provider.dart';
import 'providers/profile_provider.dart';
import 'providers/registration_provider.dart';
import 'providers/token_provider.dart';
import 'repository/fetch_booking_repository.dart';
import 'repository/registration_repository.dart';
import 'service_impl/fetch_booking_service_impl.dart';
import 'service_impl/profile_service_impl.dart';
import 'service_impl/registration_service_impl.dart';
import 'services/profile_service.dart';
import 'utils/storage_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final preferencesService = PreferencesService();
late Size screenSize;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => TokenProvider()),
    ChangeNotifierProvider(create: (_) => CheckAvailabilityProvider()),
    ChangeNotifierProvider(create: (_) => LanguageProvider()),
    ChangeNotifierProvider(
      create: (_) => LoginProvider(
        LoginRepository(
          LoginServiceImpl(baseUrl),
        ),
      ),
    ),
    Provider<RegistrationRepository>(
      create: (_) => RegistrationRepository(RegistrationServiceImpl()),
    ),
    ChangeNotifierProvider<RegistrationProvider>(
        create: (context) => RegistrationProvider(
            registrationRepository:
                Provider.of<RegistrationRepository>(context, listen: false))),
    ChangeNotifierProvider(create: (_) => HotelsProvider()),
    ChangeNotifierProvider(create: (_) => AddToSelectionProvider()),
    Provider<BookingService>(create: (_) => BookingServiceImpl()),
    ChangeNotifierProvider(
      create: (context) => BookingProvider(
        Provider.of<BookingService>(context, listen: false),
      ),
    ),
    ChangeNotifierProvider(
      create: (_) => ContactProvider(
        contactRepository: ContactRepository(
          contactService: ContactServiceImpl(),
        ),
      ),
    ),
    Provider(
      create: (_) => ReservationRepository(
        ReservationServiceImpl(),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => ReservationProvider(
        repository: Provider.of<ReservationRepository>(
          context,
          listen: false,
        ),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfileProvider(
        profileService: ProfileServiceImpl(
          repository: ProfileRepositoryImpl(),
          storageService: StorageService(),
        ),
      ),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StorageService storageService = StorageService();
  Future<bool>? tokenExpiredFuture;

  @override
  void initState() {
    super.initState();
    tokenExpiredFuture = isExpired();
  }

  Future<bool> isExpired() async {
    return await storageService.isTokenExpired();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    Dimensions.init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return FutureBuilder<bool>(
      future: tokenExpiredFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text(
                  "Error checking token status",
                ),
              ),
            ),
          );
        } else {
          final initialRoute =
              snapshot.data == true ? Routes.guest : Routes.homepage;

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
      },
    );
  }
}
