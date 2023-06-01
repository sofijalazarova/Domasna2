import 'package:flutter/material.dart';
import 'package:homework2/constants/app_router.dart';
import 'package:homework2/constants/routes.dart';
import 'package:homework2/services/auth/auth_service.dart';
import 'package:homework2/views/home.dart';
import 'package:homework2/views/login_view.dart';
import 'package:homework2/views/register_view.dart';
import 'package:homework2/views/splash/splash_screen.dart';
import 'package:homework2/views/verify_email_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework2/blocs/wishlist/wishlist_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: const HomePage(),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          notesRoute:(context) => const HomeScreen(),
        },
      ),
    );
  }
}


    // class HomePage extends StatelessWidget {
    //   const HomePage({super.key});

    //   @override
    //   Widget build(BuildContext context) {
        
    //     return FutureBuilder(
    //         future: AuthService.firebase().initialize(),
    //         builder: (context, snapshot) {
    //           switch (snapshot.connectionState) {
    //             case ConnectionState.done:

    //             final user  = AuthService.firebase().currentUser;
    //             // if (user != null){
    //             //   if (user.isEmailVerified) {
    //             //     return const HomePage();
    //             //   }
    //             //   else {
    //             //     return const VerifyEmailView();
    //             //   }
    //             // } 
    //             // else {
    //             //   return const LoginView();
    //             // }
    //               if (user != null && user.isEmailVerified) {
    //                 return const HomeScreen();
    //               } 
    //               else {
    //                 return const LoginView();
    //               }

    //             default:
    //               return const CircularProgressIndicator();
    //           }
    //         },        
    //       );
    //   }
    // }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final user = AuthService.firebase().currentUser;

//     if (user != null && user.isEmailVerified) {
//       return const HomeScreen();
//     } else {
//       return const LoginView();
//     }
//   }
// }


class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null && user.isEmailVerified) {
              return const LoginView();
            } else if (user != null && !user.isEmailVerified) {
              return const VerifyEmailView();
            } else {
              return const HomeScreen();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

