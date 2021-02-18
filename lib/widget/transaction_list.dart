import 'package:Bank/models/paidTransaction.dart';
import 'package:Bank/widget/send.dart';
import "package:flutter/material.dart";
import '../models/transaction.dart';
import '../models/user.dart';
import 'profile.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> list;
  final List<PaidTransaction> historyList;
  final User userInfo;
  // final Function sendMoney;
  // final User userInfo;

  TransactionList(this.list, this.historyList, this.userInfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text(list[index].name),
              subtitle: Text(list[index].upiId),
              trailing: IconButton(
                icon: Icon(Icons.send),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SendMoney(list[index], historyList, userInfo)),
                  );
                },
              ),
              onLongPress: (() {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Profile(list[index]);
                    });
              }),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
