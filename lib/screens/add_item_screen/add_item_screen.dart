import 'package:flutter/material.dart';
import 'package:food_boss/screens/add_item_screen/components/add_item_form.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text('Add Item'),
          ),
          body: SingleChildScrollView(
            child: AddItemForm(name: name)
          )
        )
      )
    );
  }
}