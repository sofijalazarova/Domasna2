import 'package:flutter/material.dart';
import 'package:homework2/constants/routes.dart';
import 'package:homework2/services/auth/auth_exceptions.dart';
import 'package:homework2/services/auth/auth_service.dart';
import 'package:homework2/utilities/show_error_dialog.dart';

import '../widgets/custom_appbar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

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
        appBar: const CustomAppBar(title: 'Register'),
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
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/login.png'),
                    width: 250.0,
                    height: 250.0,
                  ),
                ),
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'Enter your email here'),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(hintText: 'Enter your password here'),
                ),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      await AuthService.firebase().createUser(email: email, password: password);
                      AuthService.firebase().sendEmailVerification();                
                      Navigator.of(context).pushNamed(verifyEmailRoute);
                    } on WeakPasswordAuthException {
                      await showErrorDialog(context, 'Weak password'); 
                    } on EmailAlreadyInUseAuthException {
                      await showErrorDialog(context, 'Email already in use');
                    } on InvalidEmailAuthException {
                      await showErrorDialog(context, 'Invalid email');   
                    } on GenericAuthException {
                      await showErrorDialog(context, 'Failed to register');   
                    }
                  }, 
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Register", style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Color(0xFFE1D0BF),
                      ),),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false,);
                  }, 
                  child: const Text('Already registered? Login here!', style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Color(0xFFE1D0BF),
                    ),),
                )
              ],
            ),
          ),
        ),
      );
    }

    }