import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:recommended_app/models/user.dart';
import 'package:recommended_app/pages/home_page.dart';
import 'package:recommended_app/pages/login_page.dart';
import 'package:recommended_app/provider/authentication_service.dart';
import 'package:recommended_app/provider/database_service.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => GoogleSignInProvider(),
        ),
        StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Recommended App',
        theme: ThemeData(
          colorSchemeSeed: Colors.red,
          brightness: Brightness.dark,
          useMaterial3: true
        ),
        home: AuthenticationWrapper()
      )
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  AuthenticationWrapper({Key? key}) : super(key: key);

  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return StreamProvider<UserObj?>.value(
        value: db.streamUser(firebaseUser.uid), 
        initialData: null,
        child: const HomePage(),
      );
    }
    return const LoginPage();
  }
}
