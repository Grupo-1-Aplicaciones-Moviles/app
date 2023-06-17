class newAgency{
  final String name;
  final String email;
  final String password;
  final String description;
  final String location;
  final String ruc;
  final String phoneNumber;
  final String img_url;
  final String type_user;
  newAgency({
    required this.type_user,
    required this.img_url,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.name,
    required this.location,
    required this.description,
    required this.ruc
  });
}