import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:food_ordering_app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethod {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Stream<User> get user {
    return _auth.authStateChanges().map((auth.User firebaseUser) =>
        (firebaseUser != null) ? User(uid: firebaseUser.uid) : null);
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final auth.UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final auth.User user = userCredential.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final auth.User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      print("Sign in with google succeed: $user");

      return '$user';
    }
    return null;
  }

  Future<bool> userSignIn(String userEmail, String userPassword) async {
    try {
      auth.UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      return true;

    } catch (e) {
      print(e.message);
      return false;
    }
  }

  Future userSignUp(String userEmail, String userPassword) async {
    try {
      auth.UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      auth.User firebaseUser = userCredential.user;
      return firebaseUser.uid;
    } on auth.FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future userSignOut() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      print(e.message);
    }
  }
}
