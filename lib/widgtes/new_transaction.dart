import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newTransactions extends StatefulWidget{
  final Function addTx;

  newTransactions(this.addTx);

  @override
  State<newTransactions> createState() => _newTransactionsState();
}

class _newTransactionsState extends State<newTransactions> {
  final titileController = TextEditingController();
  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titileController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount
    );
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titileController,
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Amount"),
                onSubmitted: (_) => submitData(),
              ),
              TextButton(
                onPressed: submitData,
                child: Text('Add Transactions',style: TextStyle(color: Colors.purple),),
              )

            ],
          ),
    )
    );
  }
}