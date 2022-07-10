import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boss/providers/firebase_auth_provider.dart';
import 'package:food_boss/screens/login_screen/login_screen.dart';
import 'firebase_options.dart';
import 'package:food_boss/components/bottom_tab_navigator.dart';
import 'package:food_boss/screens/add_item_screen/add_item_screen.dart';
import 'package:food_boss/screens/home_screen/home_screen.dart';
import 'package:food_boss/screens/profile_screen.dart';
import 'package:food_boss/screens/resource_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Boss',
      theme: ThemeData(colorSchemeSeed: Colors.green),
      initialRoute: (authState.asData?.value != null) ? '/' : '/login',
      routes: {
        '/': (context) => const BottomTabNavigator(),
        '/home': (context) => const HomeScreen(),
        '/resource': (context) => const ResourceScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/additemform': (context) => const AddItemScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
