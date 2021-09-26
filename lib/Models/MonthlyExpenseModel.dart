class MonthlyExpense {
  String date;
  int tOTALEXPENSE;

  MonthlyExpense({this.date, this.tOTALEXPENSE});

  MonthlyExpense.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    tOTALEXPENSE = json['TOTAL EXPENSE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['TOTAL EXPENSE'] = this.tOTALEXPENSE;
    return data;
  }
}
