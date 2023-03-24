import 'package:flutter/material.dart';
import 'package:homework2/constants/routes.dart';
import 'package:homework2/services/auth/auth_service.dart';
import 'package:homework2/views/home.dart';
import 'package:homework2/views/login_view.dart';
import 'package:homework2/views/register_view.dart';
import 'package:homework2/views/verify_email_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute:(context) => const Calendar(),
      },
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:

            final user  = AuthService.firebase().currentUser;
            if (user != null){
              if (user.isEmailVerified) {
                return const Calendar();
              }
              else {
                return const VerifyEmailView();
              }
            } 
            else {
              return const LoginView();
            }

            default:
              return const CircularProgressIndicator();
          }
        },        
      );
  }
}
