import 'package:flutter/material.dart';
import 'package:homework2/constants/routes.dart';
import 'package:homework2/services/auth/auth_exceptions.dart';
import 'package:homework2/services/auth/auth_service.dart';
import 'package:homework2/utilities/show_error_dialog.dart';

import '../widgets/custom_appbar.dart';

class LoginView extends StatefulWidget {

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  late final TextEditingController _email;
  late final TextEditingController _password;

    @override
    void initState() {
      _email = TextEditingController();
      _password = TextEditingController();
      super.initState();
    }


    @override
    void dispose() {
      _email.dispose();
      _password.dispose();
      super.dispose();
    }



      @override
      Widget build(BuildContext context) {
      return Scaffold(
      
        appBar: const CustomAppBar(title: 'Login'),
        
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/login.png', width: 250, height: 250,), 
                    const SizedBox(height: 20),
                    TextField(
                      controller: _email,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email here',
                      ),
                    ),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password here',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;

                    try {
                      await AuthService.firebase()
                          .logIn(email: email, password: password);

                      final user = AuthService.firebase().currentUser;

                      if (user?.isEmailVerified ?? false) {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil(notesRoute, (route) => false);
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            verifyEmailRoute, (route) => false);
                      }
                    } on UserNotFoundAuthException {
                      await showErrorDialog(context, 'User not found');
                    } on WrongPasswordAuthException {
                      await showErrorDialog(context, 'Wrong credentials');
                    } on GenericAuthException {
                      await showErrorDialog(context, 'Authentication error');
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Color(0xFFE1D0BF),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        registerRoute, (route) => false);
                  },
                  child: const Text(
                    'Not registered yet? Register here!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Color(0xFFE1D0BF),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
}