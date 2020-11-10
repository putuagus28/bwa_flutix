part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(User userm) async {
    String genres = "";
    for (var genre in userm.selectedGenres) {
      genres += genres + ((genre != userm.selectedGenres.last) ? ',' : '');
    }

    _userCollection.document(userm.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }
}
