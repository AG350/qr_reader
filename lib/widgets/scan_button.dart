import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        // String barcodeScanResp = await FlutterBarcodeScanner.scanBarcode(
        //     '#8bc34a', 'No seguir', false, ScanMode.QR);
        String barcodeScanResp = 'http://google.com.ar';
        print(barcodeScanResp);
      },
    );
  }
}
