import 'package:airportcart/Currency/c_business_lounge.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/search_place/address_search.dart';
import 'package:airportcart/search_place/place_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CurrencyChooseLocation extends StatefulWidget {
  @override
  _CurrencyChooseLocationState createState() => _CurrencyChooseLocationState();
}

class _CurrencyChooseLocationState extends State<CurrencyChooseLocation> {
  TextEditingController searchLocation = TextEditingController();
  final controller = TextEditingController();
  String streetNumber = '';
  String street = '';
  String city = '';
  String zipCode = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Change Location',
            onTab: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios,
          ),
          enterLocation(),
          SizedBox(height: 10),
          kTextField(
              hint: 'USA, Birmigham T-7',
              read: true,
              textFieldcolor: Colors.blueGrey.shade50,
              border: Border.all(color: AppData.greyLight),
              controller: controller,
              keyboardType: TextInputType.streetAddress,
              radius: 5,
              onTap: () async {
                // generate a new token here
                final sessionToken = Uuid().v4();
                final Suggestion result = await showSearch(
                  context: context,
                  delegate: AddressSearch(sessionToken),
                );
                // This will change the text displayed in the TextField
                if (result != null) {
                  final placeDetails = await PlaceApiProvider(sessionToken)
                      .getPlaceDetailFromId(result.placeId);
                  setState(() {
                    controller.text = result.description;
                    streetNumber = placeDetails.streetNumber;
                    street = placeDetails.street;
                    city = placeDetails.city;
                    zipCode = placeDetails.zipCode;
                  });
                }
              },
              sufixImage: IconButton(
                  icon: Icon(Icons.gps_fixed),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrencyBusinessLoungePage()));
                  })),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: appText(
              title: 'Recent searches',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: AppData.greyLight),
                      ),
                      color: Colors.grey.shade100),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 35,
                        color: AppData.grey,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText(
                            title: 'India, Chennai T-2',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 5),
                          appText(
                            title: 'Chennai, India',
                            fontSize: 14,
                            // fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget enterLocation() {
    return InkWell(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => ChangeLocationPage()));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        // height: 50,
        color: Colors.grey.shade200,
        child: Row(
          children: [
            Icon(
              Icons.place_outlined,
              size: 30,
              // color: AppData.primery,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  title: 'Enter Location',
                  // color: AppData.primery,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                SizedBox(height: 5),
                appText(
                  title: 'Provide your current location',
                  color: AppData.grey,
                  // fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
