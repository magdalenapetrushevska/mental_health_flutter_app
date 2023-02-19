class ContactSettings{
  final String id;
  final String phone;
  final String email;

  ContactSettings({
    required this.id,
    required this.phone,
    required this.email,
  });

  @override
  String toString() {
    return 'Contact (id: $id, phone: $phone, email: $email)';
  }

}