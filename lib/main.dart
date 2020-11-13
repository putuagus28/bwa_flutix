import 'package:bwa_flutix/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Sign Up Now"),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signUp(
                      "ajussaditya@gmail.com",
                      "12345",
                      "agus",
                      ["Action", "Horror", "Music", "Drama"],
                      "Korean");

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
