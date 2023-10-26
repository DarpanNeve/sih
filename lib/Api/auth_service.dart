import 'package:SIH/Pages/commuinty_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Pages/LoginPage.dart';
import '../Widgets/Widget.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return const CommunityPage();
          // Navigate to the home page.
        } else {
          // User is not signed in.
          return const LoginPage();
          // Navigate to the login page.
        }
      },
    );
  }

  signInWithGoogle(BuildContext context) async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } else if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      showSnackBar(
          "Platform do not support login", context, Icons.error, Colors.red);
    }
  }

  signOut(BuildContext context) async {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await GoogleSignIn().signOut();
    }
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      showSnackBar("signed out.", context, Icons.done, Colors.green);
    }
  }

  createUserWithEmailAndPassword(String name, String emailAddress,
      String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      if (context.mounted) {
        showSnackBar(
            "Verification Email send", context, Icons.done, Colors.green);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password' && context.mounted) {
        showSnackBar(e.code, context, Icons.error, Colors.red);
      } else if (e.code == 'email-already-in-use' && context.mounted) {
        showSnackBar(e.code, context, Icons.error, Colors.red);
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(e.toString(), context, Icons.error, Colors.red);
      }
    }
  }

  signInWithEmailAndPassword(
      String emailAddress, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar("Please Register Before Logging In", context, Icons.error,
            Colors.red);
      } else if (e.code == 'wrong-password') {
        showSnackBar(
            "Please Enter Correct Password", context, Icons.error, Colors.red);
      }
    }
  }

  signOutWithoutSnackBar() async {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await GoogleSignIn().signOut();
    }
    await FirebaseAuth.instance.signOut();
  }

  sendVerificationEmail(BuildContext context) async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    if (context.mounted) {
      showSnackBar(
          "Verification email send", context, Icons.done, Colors.green);
    }
  }
}
