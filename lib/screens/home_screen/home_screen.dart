import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:food_boss/screens/home_screen/components/expiry_list_view.dart';
import 'package:food_boss/screens/home_screen/components/home_app_bar.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

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
              final response = await http.Client().get(Uri.parse('https://eandata.com/lookup/$barcodeScanRes'));
              if (response.statusCode == 200) {
              //Getting the html document from the response
                var document = parser.parse(response.body);
                print(response.body);
                var title = document.querySelector("title")!.text;
                int idx = title.indexOf("-");
                String name = title.substring(idx+2).trim();
                navigator.pushNamed('/additemform', arguments: name);
              }
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.edit),
            label: 'Key In',
            onTap: () {
              Navigator.pushNamed(context, '/additemform', arguments: '');
            },
          ),
        ]
      ),
    );
  }
}
