class TransactionDetails {
  double amount;
  String category;
  String currency;
  String date;
  String description;
  String type;

  TransactionDetails(
      {this.amount,
        this.category,
        this.currency,
        this.date,
        this.description,
        this.type});

  TransactionDetails.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    category = json['category'];
    currency = json['currency'];
    date = json['date'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['category'] = this.category;
    data['currency'] = this.currency;
    data['date'] = this.date;
    data['description'] = this.description;
    data['type'] = this.type;
    return data;
  }
}
