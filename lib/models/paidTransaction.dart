class PaidTransaction {
  DateTime date;
  String name;
  String upiId;
  double amount;
  PaidTransaction(
    this.name,
    this.upiId,
    this.amount,
    this.date,
  );
}
