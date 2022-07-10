import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpiryItemCard extends StatelessWidget {
  final String name;
  final DateTime expiryDate;
  const ExpiryItemCard({Key? key, required this.name, required this.expiryDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(DateFormat('dd-MMMM-yyyy').format(expiryDate)),
    );
  }
}
