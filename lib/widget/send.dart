import 'package:Bank/models/paidTransaction.dart';
import 'package:Bank/models/transaction.dart';
import "package:flutter/material.dart";
import '../models/user.dart';

// ignore: must_be_immutable
class SendMoney extends StatelessWidget {
  Transaction tx;
  User userInfo;

  final amountController = TextEditingController();
  final upiController = TextEditingController();
  List<PaidTransaction> list;
  SendMoney(this.tx, this.list, this.userInfo);
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    void Dialog(String s) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(s),
              actions: [
                RaisedButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    }

    void ConfirmDialog(String s) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(s),
              actions: [
                RaisedButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(
                          Navigator.defaultRouteName,
                        ),
                      );
                    }),
              ],
            );
          });
    }

    void checkUpi() {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Enter Upi"),
              content: TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                controller: upiController,
                maxLength: 4,
              ),
              actions: [
                RaisedButton(
                  child: Text("ok"),
                  onPressed: () {
                    if (upiController.text != userInfo.pin) {
                      upiController.clear();
                      Navigator.pop(context);
                      Dialog("Invalid Upi");
                    } else {
                      upiController.clear();
                      list.add(new PaidTransaction(
                        tx.name,
                        tx.upiId,
                        double.parse(amountController.text),
                        DateTime.now(),
                      ));
                      double paid = userInfo.balance -
                          double.parse(amountController.text);
                      userInfo.balance = paid;
                      ConfirmDialog("Transaction Completed");
                    }
                  },
                )
              ],
            );
          });
    }

    // ignore: non_constant_identifier_names

    void Authenticate() {
      try {
        if (double.parse(amountController.text) < 0.0) {
          Dialog("Enter Valid Amount");
        } else if (double.parse(amountController.text) > userInfo.balance)
          Dialog("Enter amount less than Bank Balance");
        else if (double.parse(amountController.text) > 50000) {
          Dialog("Transaction limit reached");
        } else
          checkUpi();
      } catch (Exception) {
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: MediaQuery.of(context).size.height * .07,
        title: Text("Bank"),
        backgroundColor: Colors.teal[400],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            // SizedBox(
            //   height: 2,
            // ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Card(
                elevation: 3,
                child: Image.asset(
                  "asset/images/upiImage.png",
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Recevier's Name"),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: tx.name,
                        labelStyle: TextStyle(color: Colors.blueAccent),
                      ),
                      enabled: false,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Receiver's UPI"),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: tx.upiId,
                        labelStyle: TextStyle(color: Colors.blueAccent),
                      ),
                      enabled: false,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("     Amount     "),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "",
                        labelStyle: TextStyle(color: Colors.blueAccent),
                      ),
                      keyboardType: TextInputType.number,
                      enabled: true,
                      controller: amountController,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            Flexible(
              child: RaisedButton(
                child: Text("Pay"),
                onPressed: () {
                  return Authenticate();
                },
                color: Colors.blue.withOpacity(.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
