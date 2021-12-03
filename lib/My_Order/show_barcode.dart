import 'package:airportcart/app_widget/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowBarCode extends StatefulWidget {
  @override
  _ShowBarCodeState createState() => _ShowBarCodeState();
}

class _ShowBarCodeState extends State<ShowBarCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // statusBar(context),
          // customMainAppBar(
          //   title: '',
          //   trailing: Icons.close_rounded,
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          Container(
              padding: EdgeInsets.only(top: 50, right: 20),
              alignment: Alignment.bottomRight,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close_rounded,
                      color: AppData.grey, size: 30))),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.9,
              child: QrImage(
                data: '01672721252926',
                version: QrVersions.auto,
                size: 200,
                foregroundColor: AppData.black,
              ),
            ),
          ),
          // SizedBox(height: 150),
        ],
      ),
    );
  }
}
