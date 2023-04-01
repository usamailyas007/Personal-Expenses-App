
import 'package:flutter/material.dart';

class chartBar extends StatelessWidget{
  final String lable;
  final double amountSpent;
  final double totalPct;

  chartBar(this.amountSpent,this.totalPct,this.lable);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        FittedBox(
          child: Text('\$${amountSpent.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1.0),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalPct,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4,),
        Text(lable)
      ],
    );
  }
}