part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SigInSignUpResult> signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {
      // mendaftarkan email dan password ke Firebase
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User users = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return SigInSignUpResult(user: user)
    } catch (e) {
      return SigInSignUpResult(message: e.toString());
    }
  }
}

class SigInSignUpResult {
  final User user;
  final String message;

  SigInSignUpResult({this.user, this.message});
}
