import 'package:flutter/material.dart';
import '../models/Transaction.dart';

class UserInput extends StatelessWidget {
  final Function(String, double) addnewtransaction;
  final TextEditingController titlecontroller;
  final TextEditingController amountcontroller;

  UserInput(this.addnewtransaction)
      : titlecontroller = TextEditingController(),
        amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'product'),
            controller: titlecontroller,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'price'),
            controller: amountcontroller,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onSurface: Theme.of(context).primaryColor),
            child: Text('add transaction'),
            onPressed: () {
              addnewtransaction(
                titlecontroller.text,
                double.parse(amountcontroller.text),
              );
            },
          ),
        ],
      )),
    );
  }
}
