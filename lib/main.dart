import 'package:chat_application/providers/auth_provider.dart';
import 'package:chat_application/providers/shared_prefrences_provider.dart';
import 'package:chat_application/screens/login_screen.dart';
import 'package:chat_application/screens/otp_screen.dart';
import 'package:chat_application/utilities/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

  } catch (e) {
    print('Firebase initialization failed: $e');
  }

  final sharedPreferencesService = SharedPrefrencesService();
  await sharedPreferencesService.loadPrefrences();
  runApp(MyApp(sharedPreferencesService: sharedPreferencesService,));
}

class MyApp extends StatelessWidget {
  final SharedPrefrencesService sharedPreferencesService;

  const MyApp({super.key, required this.sharedPreferencesService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider.value(value: sharedPreferencesService),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: OtpScreen(),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedPrefrencesService>(
        builder: (context, sharedPreference, _) {
          // sharedPreference.loadPrefrences();
          // return OtpScreen();
      return sharedPreference.isLoggedIn ? HomeScreen() : LoginScreen();
    });
  }
}
