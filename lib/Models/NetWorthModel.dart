class NetWorth {
  String date;
  int sum;
  int cumulativeSum;

  NetWorth({this.date, this.sum, this.cumulativeSum});

  NetWorth.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    sum = json['sum'];
    cumulativeSum = json['cumulative sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['sum'] = this.sum;
    data['cumulative sum'] = this.cumulativeSum;
    return data;
  }
}
