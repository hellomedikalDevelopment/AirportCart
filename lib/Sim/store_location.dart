import 'dart:async';

import 'package:airportcart/Currency/c_choose_location.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimStoreLocation extends StatefulWidget {
  @override
  _SimStoreLocationState createState() => _SimStoreLocationState();
}

class _SimStoreLocationState extends State<SimStoreLocation> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Airtel Store Direction',
            onTab: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios_rounded,
            // trailing: Icons.filter_list_rounded,
            // onPressed: () {
            //   filter();
            // }
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.88,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    // alignment: Alignment.bottomCenter,
                    // height: MediaQuery.of(context).size.height * 0.88,
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.13,
                          decoration: BoxDecoration(
                              color: AppData.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Container()),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText(
                                        title: ' Airtel Store',
                                        fontWeight: FontWeight.bold,
                                        color: AppData.primary,
                                        fontSize: 14),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        // SizedBox(width: 5),
                                        Icon(
                                          Icons.location_on,
                                          color: AppData.primary,
                                          size: 24,
                                        ),
                                        appText(
                                            title: '10 Mtr Left',
                                            color: AppData.grey,
                                            fontSize: 14),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(top: 20),
                          // color: AppData.primary,
                          // height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CurrencyChooseLocation()));
                                },
                                child: Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: AppData.primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Icon(Icons.near_me_outlined,
                                      color: AppData.white, size: 24),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: AppData.greyDark,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Icon(Icons.close_rounded,
                                      color: AppData.white, size: 24),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
