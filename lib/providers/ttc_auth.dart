import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum TTCAuthStatus {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated
}

class TTCAppData extends ChangeNotifier {
  TTCAuthStatus _status = TTCAuthStatus.Uninitialized;

  void updateStatus(User? user) {
    _status = user == null
        ? TTCAuthStatus.Unauthenticated
        : TTCAuthStatus.Authenticated;
    debugPrint("Status: $_status");
    notifyListeners();
  }

  TTCAppData() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      updateStatus(user);
      notifyListeners();
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  Future<void> signInWithSMS(String phoneNumber, String smsCode) async {
    ConfirmationResult confirmationResult =
        await _auth.signInWithPhoneNumber(phoneNumber);

    UserCredential userCredential =
        await confirmationResult.confirm(confirmationResult.verificationId);
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: confirmationResult.verificationId,
      smsCode: smsCode,
    );
    await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
