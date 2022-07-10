import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boss/services/firebase_auth_service.dart';

final authServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authServiceProvider).authStateChanges;
});

final signInProvider = FutureProvider.autoDispose<UserCredential?>((ref) async {
  return ref.read(authServiceProvider).signIn();
});

final signOutProvider = FutureProvider.autoDispose<String>((ref) async {
  return ref.read(authServiceProvider).signOut();
});
