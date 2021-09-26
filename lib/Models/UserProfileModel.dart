class UserProfile {
  String username;
  String email;
  String dob;
  int balance;
  String country;

  UserProfile(
      {this.username, this.email, this.dob, this.balance, this.country});

  UserProfile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    dob = json['dob'];
    balance = json['balance'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['balance'] = this.balance;
    data['country'] = this.country;
    return data;
  }
}
