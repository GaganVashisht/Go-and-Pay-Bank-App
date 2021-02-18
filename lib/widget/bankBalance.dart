import "package:flutter/material.dart";
import '../models/user.dart';

class BankBalance extends StatelessWidget {
  // final upiController = TextEditingController();
  User userInfo;
  BankBalance(this.userInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        children: [
          SizedBox(
            height: 23,
          ),
          ListTile(
            title: Text(
              "Bank Balance",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            trailing: FittedBox(
              child: Text(
                "${userInfo.balance}",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          userInfo.balance > 2000
              ? Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Card(
                    child: Image.asset("asset/images/positive.png"),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Card(
                    child: Image.asset("asset/images/negative.jpg"),
                  ),
                )
        ],
      ),
    );
  }
}
