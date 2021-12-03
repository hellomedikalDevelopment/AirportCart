import 'package:flutter/material.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/Dining_Table/Food_Booking/change_location.dart';

class NoDataFound extends StatefulWidget {
  final String addres;

  const NoDataFound({Key key, this.addres});
  @override
  _NoDataFoundState createState() => _NoDataFoundState();
}

class _NoDataFoundState extends State<NoDataFound> {
  TextEditingController search = TextEditingController();
  TextEditingController location = TextEditingController();
  void initState() {
    super.initState();
    setState(() {
      location.text = widget.addres;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.addres);
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Resturant',
              onTab: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_rounded),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                searchbar(
                  context: context,
                  controller: search,
                  hint: 'Resturant Name...',
                  onTap: () {},
                ),
                searchFood(
                  controller: location,
                  hint: 'Enter Location',
                  color: AppData.primary,
                  prefixicon: Icon(
                    Icons.location_on_outlined,
                    color: AppData.primary,
                  ),
                  ontap: () {},
                ),
                SizedBox(height: 25),
                Container(
                  height: 350,
                  width: 350,
                  child: Image(
                    image: AssetImage(Strings.nodata),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                customButton(
                  title: 'Choose Location',
                  margin: 50,
                  textColor: Colors.white,
                  radius: 25,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeLocationPage()));
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
