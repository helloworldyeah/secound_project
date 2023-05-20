import 'package:flutter/material.dart';

import './widgets/UserInput.dart';
import './widgets/TransactionList.dart';
import '../models/Transaction.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'secound app',
      theme: ThemeData(primarySwatch: Colors.purple, accentColor: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  var random = Random();
  final List<Transaction> Transactions = [
    Transaction(id: 1, product: 'shoes', amount: 48.2, date: DateTime.now()),
    Transaction(id: 2, product: 'h', amount: 45.2, date: DateTime.now()),
    Transaction(id: 3, product: 's', amount: 28.8, date: DateTime.now()),
    Transaction(id: 4, product: 'shfoes', amount: 74.9, date: DateTime.now()),
  ];
  void addnewtransaction(String product, double amount) {
    final trans = Transaction(
        id: random.nextInt(10),
        product: product,
        amount: amount,
        date: DateTime.now());

    setState(() {
      Transactions.add(trans);
    });
  }

  void startnewuserinput(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: UserInput(addnewtransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second app'),
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit_sharp),
            onPressed: () {
              startnewuserinput(context);
              // Add your desired functionality here
              // This code will be executed when the button is pressed
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              child: Card(
                child: Text('chart'),
                color: Colors.blue,
                elevation: 5,
              )),
          TransactionList(Transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_sharp),
        onPressed: () {
          startnewuserinput(context);
        },
      ),
    );
  }
}
