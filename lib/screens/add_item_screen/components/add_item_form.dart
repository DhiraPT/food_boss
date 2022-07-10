import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boss/providers/firestor_provider.dart';
import 'package:intl/intl.dart';

class AddItemForm extends ConsumerStatefulWidget {
  const AddItemForm({Key? key}) : super(key: key);

  @override
  ConsumerState<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends ConsumerState<AddItemForm> {
  DateTime? expiryDate;
  late TextEditingController _textEditingController;
  final _addItemFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _addItemFormKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _textEditingController,
                  validator: (value) {
                    return (value == '') ? 'Item name cannot be empty.' : null;
                  },
                  decoration: const InputDecoration(
                    helperText: '',
                    filled: true,
                    hintText: 'Enter item Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 15.0),
                child: TextFormField(
                  enableInteractiveSelection: false,
                  focusNode: FocusNode(),
                  controller: TextEditingController(
                      text: (expiryDate != null)
                          ? DateFormat('dd-MMMM-yyyy').format(expiryDate!)
                          : null),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return (value == '')
                        ? 'Expiry date cannot be empty.'
                        : null;
                  },
                  onTap: () async {
                    var datePicked = DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: false,
                    );
                    final datePicked2 = await datePicked;
                    setState(() {
                      if (datePicked2 != null) {
                        expiryDate = datePicked2;
                      }
                    });
                  },
                  decoration: const InputDecoration(
                    helperText: '',
                    filled: true,
                    hintText: 'Select expiry date',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 15.0),
                child: ElevatedButton(
                  child: const Text("Add Item"),
                  onPressed: () {
                    if (_addItemFormKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      ref.read(itemsProvider.notifier).state.add({
                        "Name": _textEditingController.text,
                        "Expiry Date": expiryDate
                      });
                      Navigator.of(context).pop();
                    }
                  },
                ),
              )
            ]));
  }
}
