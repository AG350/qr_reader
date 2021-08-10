import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ScanProvider>(context, listen: false).clearAll();
            },
            icon: Icon(Icons.delete_forever),
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scanProvider = Provider.of<ScanProvider>(context);

    //final tempScan = new ScanModel(value: 'https://google.com.ar');
    //DBProvider.db.initDB();
    //DBProvider.db.newScan(tempScan);
    //DBProvider.db.getAllScans().then(print);
    //DBProvider.db.getScanById(8).then((value) => print(value?.value));
    //final ScanModel newScan = new ScanModel(id: 1, type: 'geo', value: 'geo- 31.313,321.3');
    //DBProvider.db.updateScan(newScan).then((value) => print(value));
    //DBProvider.db.deleteAllScan().then((print));

    switch (currentIndex) {
      case 0:
        scanProvider.loadScansByType('geo');
        return ScanTiles();
      case 1:
        scanProvider.loadScansByType('http');
        return ScanTiles();
      default:
        return MapsScreen();
    }
  }
}
