import 'package:Bank/models/paidTransaction.dart';
import "package:flutter/material.dart";

import 'transaction_list.dart';
import '../models/transaction.dart';
import '../models/user.dart';
import 'user_data.dart';

class Front extends StatelessWidget {
  User userInfo;
  List<Transaction> list;
  List<PaidTransaction> historyList;
  Front(this.list, this.historyList, this.userInfo);

  void profile(context, userInfo) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return UserData(userInfo);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Money Transfer"),
        backgroundColor: Colors.teal[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              return profile(context, userInfo);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionList(list, historyList, userInfo),
          ],
        ),
      ),
    );
  }
}
