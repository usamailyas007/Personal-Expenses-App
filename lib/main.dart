import 'dart:ffi';
import 'package:personal_exp_app/models/transaction.dart';
import 'package:personal_exp_app/widgtes/new_transaction.dart';
import 'package:personal_exp_app/widgtes/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'ShantellSans',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(
            fontFamily: "ShantellSans",
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransaction = [];

  void _addNewTransaction(String txTitile, double txAmount) {
    final newTx = Transaction(
        titile: txTitile,
        id: DateTime.now().toString(),
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      userTransaction.add(newTx);
    });
  }
  void startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
        context: ctx,
        builder: (_){
          return GestureDetector(
            onTap: (){},
            child: newTransactions(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: [
            IconButton(onPressed: (){
              startAddNewTransaction(context);
            }, icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.grey,
                  child: Text('Chart!'),
                  elevation: 5,
                ),
              ),
              TransactionList(userTransaction)
            ],
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
          startAddNewTransaction(context);
          }),
    );
  }
}
