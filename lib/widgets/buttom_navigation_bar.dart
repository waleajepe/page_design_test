import 'package:flutter/material.dart';

class ButtomNavigationBar extends StatelessWidget {
  const ButtomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 50.0,
        margin: const EdgeInsets.only(top: 25.0, bottom: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.pink,
            border: Border.all(color: Colors.grey)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            child: Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ))),
      ),
    );
  }
}
