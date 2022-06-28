class Contact {
  final String user;
  final String phone;
  final String checkIn;

  Contact( this.user, this.phone, this.checkIn);

  factory Contact.fromJson(Map<String, dynamic> json){
    return Contact(
      json['user'],
      json['phone'],
      json['check-in'],
    );
  }
}