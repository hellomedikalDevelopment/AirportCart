import 'package:airportcart/Currency/c_enable_location.dart';
import 'package:airportcart/Currency/exchange_currency_rate.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class ChooseCurrencyPage extends StatefulWidget {
  @override
  _ChooseCurrencyPageState createState() => _ChooseCurrencyPageState();
}

class _ChooseCurrencyPageState extends State<ChooseCurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Currency',
            onTab: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: appText(
                      title: 'Choose Any One Category',
                      maxLines: 2,
                      fontSize: 22,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  listTile(
                    image: Strings.check_money,
                    title: 'Check Money Exchange Rate',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExchangeCurrencyRate()));
                    },
                  ),
                  SizedBox(height: 20),
                  listTile(
                    image: Strings.find_exchange,
                    title: 'Find Exchange Currency Shops',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurrencyEnableLocation()));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listTile({String image, String title, Function onTap}) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppData.white,
        // boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 65,
                width: 65,
                child: Image.asset(image),
              ),
              SizedBox(width: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: appText(
                  title: title,
                  fontSize: 20,
                  height: 1.25,
                  maxLines: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppData.primary,
              ),
              child:
                  Icon(Icons.arrow_forward_ios_rounded, color: AppData.white),
            ),
          ),
        ],
      ),
    );
  }
}
