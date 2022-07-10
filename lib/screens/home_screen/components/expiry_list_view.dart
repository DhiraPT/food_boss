import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boss/providers/firestor_provider.dart';
import 'package:food_boss/screens/home_screen/components/expiry_item_card.dart';

class ExpiryListView extends ConsumerWidget {
  const ExpiryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index != items.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: ExpiryItemCard(name: items[index]["Name"], expiryDate: items[index]["Expiry Date"]),
            );
          } else {
            return ExpiryItemCard(name: items[index]["Name"], expiryDate: items[index]["Expiry Date"]);
          }
        },
        childCount: items.length, //subcategoryItems.length
      )
    );
  }
}