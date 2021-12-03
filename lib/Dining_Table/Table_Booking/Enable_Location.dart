import 'package:airportcart/Dining_Table/Food_Booking/NoDataFound.dart';
import 'package:airportcart/Dining_Table/Table_Booking/ResturantPage.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class EnableLocation extends StatefulWidget {
  @override
  _EnableLocationState createState() => _EnableLocationState();
}

class _EnableLocationState extends State<EnableLocation> {
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
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.location_on,
                color: Colors.white,
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
                color: Colors.grey,
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
                    MaterialPageRoute(builder: (context) => OpenSeting()));
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

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    if (place != null) {
      print('getSponsorCampaignLists:$place');
    }
  }
}

class OpenSeting extends StatefulWidget {
  @override
  _OpenSetingState createState() => _OpenSetingState();
}

class _OpenSetingState extends State<OpenSeting> {
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
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.location_on,
                color: Colors.white,
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
                color: Colors.grey,
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
                    MaterialPageRoute(builder: (context) => ResturantPage()));
              },
            ),
            SizedBox(height: 15),
            customButton(
              title: 'Remind me later',
              margin: 50,
              color: Colors.transparent,
              textColor: Colors.grey,
              radius: 25,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoDataFound()));
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
