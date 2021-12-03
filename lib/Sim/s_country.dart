import 'package:airportcart/app_widget/widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../app_widget/app_data.dart';

class SimCountrySearch extends StatefulWidget {
  @override
  _SimCountrySearchState createState() => _SimCountrySearchState();
}

class _SimCountrySearchState extends State<SimCountrySearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Sim Country',
            onTab: () {
              Navigator.pop(context);
            },
            // icon: Icons.arrow_back_ios_rounded,
            // trailing: Icons.filter_list_rounded,
            // onPressed: () {
            // filter();
            // }
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: appText(
                              title: 'Current',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          country(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  country() {
    return showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: AppData.white,
        textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
      onSelect: (Country country) =>
          print('Select country: ${country.displayName}'),
    );
  }
}
