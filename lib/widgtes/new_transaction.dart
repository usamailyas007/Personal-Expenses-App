import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class newTransactions extends StatefulWidget {
  final Function addTx;

  newTransactions(this.addTx);

  @override
  State<newTransactions> createState() => _newTransactionsState();
}

class _newTransactionsState extends State<newTransactions> {
  final titileController = TextEditingController();
  final amountController = TextEditingController();
   var _selectedDate;

  void submitData() {
    if(amountController.text.isEmpty){
      return;
    }

    final enteredTitle = titileController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
        enteredTitle,
        enteredAmount,
        _selectedDate);
    Navigator.of(context).pop();
  }

  Future<DateTime?> _presentDatePicker() {
    return showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050)).then((pickedDate) {
          if(pickedDate == null){
            return;
          }
          setState(() {
            _selectedDate = pickedDate;
          });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10
          ),
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
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedDate == null ? 'No Date Choosen!!' : DateFormat.yMd().format(_selectedDate)),
                    TextButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        child: Text(
                          'Choose date',
                          style:
                          TextStyle(color: Theme
                              .of(context)
                              .primaryColor, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      )
                  ),
                  onPressed: submitData,
                  child: Text(
                    'Add Transactions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
