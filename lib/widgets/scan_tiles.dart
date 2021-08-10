import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);
    final scans = scanProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, int index) {
        return Dismissible(
          key: Key(scans[index].id.toString()),
          onDismissed: (DismissDirection direction) {
            Provider.of<ScanProvider>(context, listen: false)
                .clearById(scans[index].id!);
          },
          background: Container(
            color: Colors.red,
          ),
          child: ListTile(
            leading: Icon(
              scans[index].type == 'http'
                  ? Icons.emoji_flags_sharp
                  : Icons.near_me_sharp,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(scans[index].value),
            subtitle: Text('${scans[index].id}'),
            trailing: Icon(
              Icons.keyboard_arrow_right_sharp,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () => launchURL(context, scans[index]),
          ),
        );
      },
    );
  }
}
