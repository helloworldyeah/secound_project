import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> Transactions;

  TransactionList(this.Transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView(
            children: Transactions.map((e) {
          return Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                padding: EdgeInsets.all(7),
                child: Text(
                  e.amount.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Column(
                children: [
                  Text(
                    e.product,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(DateFormat('yyyy-MM-dd').format(e.date),
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w300)),
                ],
              )
            ],
          ));
        }).toList()));
  }
}
