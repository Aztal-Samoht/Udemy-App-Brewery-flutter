import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_h_cripto_tracker/constants.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'network_helper.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String price = '??';
  Uri BitcoinUrl;
  String buttonString = 'update price';

  void updateUrl() {
    BitcoinUrl = NetworkHelper.buildUrl(kBtcPath, selectedCurrency);
    print(BitcoinUrl);
  }

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> menuItems = [];
    kCurrenciesList.forEach((String a) {
      menuItems.add(DropdownMenuItem(child: Text(a), value: a));
    });
    return DropdownButton<String>(
      value: selectedCurrency,
      items: menuItems,
      // [Dropdown]
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  // () {
  // setState(
  // () async {
  // var data = (await NetworkHelper.staticGetData(
  // BitcoinUrl))['src_side_base'][0]['rate']
  //     .toString();
  // print(data);
  // print(data.runtimeType);
  // price = data;
  // },
  // );
  // },
  Future<String> getPrice() async {
    return (await NetworkHelper.staticGetData(BitcoinUrl))['src_side_base'][0]
            ['rate']
        .toStringAsFixed(5);
  }

  void updatePrice() async {
    String newPrice = await getPrice();
    setState(() {
      price = newPrice;
    });
  }

  CupertinoPicker getCupertinoPicker() {
    List<Text> menuItems = [];
    kCurrenciesList.forEach((String a) {
      menuItems.add(
        Text(
          a,
          style: TextStyle(color: Colors.white),
        ),
      );
    });
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: menuItems,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Center(
                  child: Text(
                    '1 BTC = $price $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: updatePrice,
            child: Text(
              buttonString,
              style: TextStyle(color: Colors.black, fontSize: 100),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
          ),
        ],
      ),
    );
  }
}
