class UserEntity {
  final String userId;
  final String email;
  final String name;
  final bool cartIsActive;

  UserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.cartIsActive,
  });

  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'cartIsActive': cartIsActive,
    };
  }

 static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
      userId: doc['userId'],
      email: doc['email'],
      name: doc['name'],
      cartIsActive: doc['cartIsActive'],
    );
  }
}
