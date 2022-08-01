import 'dart:typed_data';

import 'package:demo_proj_00/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  //function for google sign in
  final _googleSignIn = GoogleSignIn();
  signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
      if (googleAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await firebaseAuth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  //function to signin with facebook
  signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential fbAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return firebaseAuth.signInWithCredential(fbAuthCredential);
  }

  //function to signout
  signOut() async {
    await firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  //function to add image in storage
  _uploadImageToStorage(Uint8List image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePic')
        .child(firebaseAuth.currentUser!.uid);

    ref.putData(image);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //function to enable user image pick
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image Selected');
    }
  }

  //function for signup with google

  //function for sign up users
  Future<String> signUpUsers(String full_name, String username, String email,
      String password, Uint8List? image) async {
    String res = "Some error occured";
    try {
      if (full_name.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        String downloadUrl = await _uploadImageToStorage(image);

        await firebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName': full_name,
          'userName': username,
          'email': email,
          'image': downloadUrl,
        });
        print(cred.user!.email);
        res = 'success';
      } else {
        res = 'Please enter all fields';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  void loginUsers(String text, String text2) {}

  void loginUser(String text, String text2) {}

  forgotPassword(String text) {}
}

//function to login
loginUser(String email, String password) async {
  String res = "some error occured";
  try {
    if (email.isNotEmpty && password.isNotEmpty) {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = 'success';
      print('you are logged in');
    } else {
      res = 'Fields must not be empty';
    }
  } catch (e) {
    res = e.toString();
  }
  return res;
}

//function to forgot password
forgotPassword(String email) async {
  String res = "Some error occured";
  try {
    if (email.isNotEmpty) {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      res = 'success';
      print('Password link sent to your email');
    } else {
      res = "Provide valid email";
    }
  } catch (e) {
    res = e.toString();
  }
  return res;
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
