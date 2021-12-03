import 'package:airportcart/Business_Lounge/b_not_found.dart';
import 'package:airportcart/Business_Lounge/business_lounge.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class BusinessEnableLocation extends StatefulWidget {
  @override
  _BusinessEnableLocationState createState() => _BusinessEnableLocationState();
}

class _BusinessEnableLocationState extends State<BusinessEnableLocation> {
  // LatLng latlng = LatLng(0.0, 0.0);
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            CircleAvatar(
              radius: 45,
              backgroundColor: AppData.greyLight,
              child: Icon(
                Icons.location_on,
                color: AppData.white,
                size: 50,
              ),
            ),
            SizedBox(height: 35),
            Container(
              width: 200,
              child: appText(
                title: 'Enable Precise location',
                fontSize: 22,
                maxLines: 2,
                textAlign: TextAlign.center,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              child: appText(
                title:
                    'Your location will be used to show shopping store near you.',
                color: AppData.grey,
                fontSize: 16,
                maxLines: 2,
                letterSpacing: 0.5,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 25),
            customButton(
              title: 'Enable',
              margin: 50,
              radius: 25,
              onTap: () {
                getLocation();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OpenSetting()));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Container(
                width: 250,
                child: appText(
                  title:
                      '🔒 Magicaly secured text to make all security concerns go away.',
                  fontSize: 14,
                  letterSpacing: 0.5,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ))
          ],
        ),
      ),
    );
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMarks[0];

    if (place != null) {
      print('getSponsorCampaignLists:$place');
    }
  }
}

class OpenSetting extends StatefulWidget {
  @override
  _OpenSettingState createState() => _OpenSettingState();
}

class _OpenSettingState extends State<OpenSetting> {
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            CircleAvatar(
              radius: 45,
              backgroundColor: AppData.greyLight,
              child: Icon(
                Icons.location_on,
                color: AppData.white,
                size: 50,
              ),
            ),
            SizedBox(height: 35),
            Container(
              width: 200,
              child: appText(
                title: 'Where are you?',
                fontSize: 22,
                maxLines: 2,
                textAlign: TextAlign.center,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              child: appText(
                title:
                    'You’ll need to enable your location in order to use this app.',
                color: AppData.grey,
                fontSize: 16,
                maxLines: 2,
                letterSpacing: 0.5,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 25),
            customButton(
              title: 'Open Settings',
              margin: 50,
              radius: 25,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusinessLoungePage()));
              },
            ),
            SizedBox(height: 15),
            customButton(
              title: 'Remind me later',
              margin: 50,
              color: Colors.transparent,
              textColor: AppData.grey,
              radius: 25,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusinessNotFound()));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            Container(
                width: 250,
                child: appText(
                  title:
                      '🔒 Magicaly secured text to make all security concerns go away.',
                  fontSize: 14,
                  letterSpacing: 0.5,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ))
          ],
        ),
      ),
    );
  }
}
