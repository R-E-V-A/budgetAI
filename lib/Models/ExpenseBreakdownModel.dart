class ExpenseBreakdown {
  String category;
  int sum;

  ExpenseBreakdown({this.category, this.sum});

  ExpenseBreakdown.fromJson(Map<String, dynamic> json) {
    category = json['Category'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category'] = this.category;
    data['sum'] = this.sum;
    return data;
  }
}
