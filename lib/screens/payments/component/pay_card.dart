import 'package:flutter/material.dart';
import 'package:masdamas/models/payments.dart';
import 'package:masdamas/screens/payments/component/payment_widget.dart';

class PaymentsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.grey.withOpacity(.1),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Payment History",
          style: TextStyle(color: Colors.black),
        ),

      ),
      body: ListView(
        children: [
          Column(
            children:  [PaymentsModel(
              amount: "12",
              status: "completed",
              createdAt: 1622834743733,

            )].map((payment) => PaymentWidget(paymentsModel: payment)).toList()       // paymentsController.payments.map((payment) => PaymentWidget(paymentsModel: payment,)).toList()
            ,
          )
        ],
      ),
    );
  }


}