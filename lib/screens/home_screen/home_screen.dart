import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:food_boss/screens/home_screen/components/expiry_list_view.dart';
import 'package:food_boss/screens/home_screen/components/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          HomeAppBar(),
          ExpiryListView(),
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.qr_code_scanner_rounded),
            label: 'Scan',
            onTap: () async {
              final navigator = Navigator.of(context);
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "#ff6666", "Cancel", false, ScanMode.BARCODE
              );
              navigator.pushNamed('/additemform');
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.edit),
            label: 'Key In',
            onTap: () {
              Navigator.pushNamed(context, '/additemform');
            },
          ),
        ]
      ),
    );
  }
}
