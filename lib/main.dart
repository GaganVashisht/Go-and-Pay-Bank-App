import 'package:Bank/widget/front.dart';
import 'package:Bank/widget/history.dart';
import 'package:Bank/models/paidTransaction.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'widget/bankBalance.dart';
import 'models/transaction.dart';
import 'models/user.dart';
import "package:flip_card/flip_card.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank App",
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  User userInfo = new User();
  List<Transaction> list = [
    new Transaction("1", "Divyan", "divaymbhutiani.@okaxis"),
    new Transaction("2", "Mukul", "bhutinaimukul.@okaxis"),
    new Transaction("3", "Girish", "girishpandey.@okaxis"),
    new Transaction("4", "Ishant", "ishantrajput.@okaxis"),
    new Transaction("5", "Scout", "ScoutOp.@okaxis"),
    new Transaction("6", "Raman", "ramandeep.@okaxis"),
    new Transaction("7", "Vitesh", "vitesh.@okaxis"),
    new Transaction("8", "Ayush", "ayushgupta.@okaxis"),
    new Transaction("9", "Jatin", "jatinthakur.@okaxis"),
    new Transaction("10", "Harsh Jindal", "harshjindal.@okaxis"),
  ];
  List<PaidTransaction> historyList = [];
  final upiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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

    void sheet() {
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return BankBalance(userInfo);
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
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(Navigator.defaultRouteName),
                    );
                    sheet();
                  }
                },
              )
            ],
          );
        },
      );
    }
    // TODO: implement build

    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 8),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Container(
                      height: 59,
                      width: 59,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('asset/images/bankicon.jpg')),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Hello ",
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      userInfo.username,
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: Container(
                    height: 199,
                    margin: EdgeInsets.only(right: 10),
                    child: ListView(
                      padding: EdgeInsets.only(left: 16, right: 6),
                      children: [
                        Container(
                          height: 199,
                          width: 344,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('asset/images/debitcard.png')),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "SBI Bank",
                                      style: GoogleFonts.inter(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 50, bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      userInfo.username,
                                      style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  back: Container(
                    height: 199,
                    margin: EdgeInsets.only(right: 10),
                    child: ListView(
                      padding: EdgeInsets.only(left: 16, right: 6),
                      children: [
                        Container(
                          height: 199,
                          width: 344,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/back.jpeg')),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "SBI Bank",
                                      style: GoogleFonts.inter(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          bottom: 13,
                          top: 29,
                        ),
                        child: Container(
                          child: Text(
                            "Operations",
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            shape: BoxShape.rectangle,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Front(list, historyList, userInfo)));
                            },
                            child: Card(
                                color: Colors.lightBlue[800],
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              child: Container(
                                                height: 80,
                                                child: Image(
                                                  image: AssetImage(
                                                      "asset/images/moneytransfer.jpeg"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                "Send Money   ",
                                                style: GoogleFonts.inter(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 150,
                          width: 160,
                          //   color: Colors.red,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            shape: BoxShape.rectangle,
                          ),
                          child: InkWell(
                            onTap: () {
                              // checkUpi()==true? print("correct Upi"): print(" incorrect");
                              checkUpi();
                            },
                            child: Card(
                                color: Colors.lightBlue[800],
                                child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              child: Container(
                                                height: 80,
                                                child: Image(
                                                  image: AssetImage(
                                                      "asset/images/bankbalance.jpeg"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                "Bank Balance  ",
                                                style: GoogleFonts.inter(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            shape: BoxShape.rectangle,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                (context),
                                MaterialPageRoute(
                                  builder: (context) =>
                                      History(list, historyList, userInfo),
                                ),
                              );
                            },
                            child: Card(
                                color: Colors.lightBlue[800],
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              child: Container(
                                                height: 80,
                                                child: Image(
                                                  image: AssetImage(
                                                      "asset/images/banktransaction.jpeg"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                "History   ",
                                                style: GoogleFonts.inter(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                      height: 100,
                      child: Image(
                        image: AssetImage('asset/images/bankicon.jpg'),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Go & Pay",
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              )
            ],
          )),
    );
  }
}
