part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      // mendaftarkan email dan password ke Firebase
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserX user1 = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user1);

      return SignInSignUpResult(user: user1);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }
}

class SignInSignUpResult {
  final UserX user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
