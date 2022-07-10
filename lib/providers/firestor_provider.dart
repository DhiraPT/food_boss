import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boss/services/firestore_service.dart';

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final itemsProvider = StateProvider<List<Map<String, dynamic>>>((ref) {
  return [];
});