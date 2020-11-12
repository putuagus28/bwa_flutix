part of 'extensions.dart';

extension FirebaseUserExtension on User {
      UserX convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      UserX(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);


//  Future<User> fromFireStore() async => await UserX.getUser(this.uid);
}
