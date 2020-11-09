part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    String genres = "";
    for (var genre in user.selectedGenres) {
      genres += genres + ((genre != user.selectedGenres.last) ? ',' : '');
    }

    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }
}
