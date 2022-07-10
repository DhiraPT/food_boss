import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boss/providers/firebase_auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                ref.watch(signInProvider.future).then((value) {
                  if (value != null) {
                    Navigator.pushNamed(context, '/');
                  }
                });
              },
              child: const Text('Sign In'),
            )
          )
        )
      )
    );
  }
}
