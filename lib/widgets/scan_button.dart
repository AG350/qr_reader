import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanResp = await FlutterBarcodeScanner.scanBarcode(
            '#8bc34a', 'No seguir', false, ScanMode.QR);
        if (barcodeScanResp == '-1') {
          return;
        }
        //final barcodeScanResp = 'geo:-27.384373, -55.902419';
        final scanProvider = Provider.of<ScanProvider>(context, listen: false);
        //inal barcodeScanResp = ('http://google.com.ar');
        final newScan = await scanProvider.newScan(barcodeScanResp);
        launchURL(context, newScan);
      },
    );
  }
}
