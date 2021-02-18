import 'dart:io';

import 'package:Bank/models/paidTransaction.dart';
import '../models/transaction.dart';
import "package:flutter/material.dart";
import '../models/user.dart';
import 'front.dart';
import "package:intl/intl.dart";

class History extends StatelessWidget {
  List<PaidTransaction> historyList;
  List<Transaction> list;
  User userInfo;
  History(this.list, this.historyList, this.userInfo);

  @override
  Widget build(BuildContext context) {
    // print(list);
    list.reversed;
    //print(list);

    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: historyList.length == 0
          ? Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "No Transaction Done",
                  style: TextStyle(fontSize: 25, color: Colors.purple),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .6,
                      child: Image.asset(
                        "asset/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Container(
              height: MediaQuery.of(context).size.height * .89,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Row(
                        children: [
                          Text("Receiver :"),
                          Text(historyList[index].name),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("Date :"),
                          Text(DateFormat.yMMMMd()
                              .format(historyList[index].date)),
                        ],
                      ),
                      trailing: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text("- ₹.${historyList[index].amount}")),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: historyList.length,
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Front(list, historyList, userInfo),
                  ),
                );
              },
            ),
    );
  }
}
