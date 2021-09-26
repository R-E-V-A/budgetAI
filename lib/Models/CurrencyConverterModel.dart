class CurrencyConverter {
  bool success;
  Query query;
  Info info;
  bool historical;
  String date;
  double result;
  String unit;

  CurrencyConverter(
      {this.success,
        this.query,
        this.info,
        this.historical,
        this.date,
        this.result,
        this.unit});

  CurrencyConverter.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    historical = json['historical'];
    date = json['date'];
    result = json['result'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.query != null) {
      data['query'] = this.query.toJson();
    }
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    data['historical'] = this.historical;
    data['date'] = this.date;
    data['result'] = this.result;
    data['unit'] = this.unit;
    return data;
  }
}

class Query {
  String from;
  String to;
  String amount;

  Query({this.from, this.to, this.amount});

  Query.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['amount'] = this.amount;
    return data;
  }
}

class Info {
  int timestamp;
  double rate;

  Info({this.timestamp, this.rate});

  Info.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['rate'] = this.rate;
    return data;
  }
}
