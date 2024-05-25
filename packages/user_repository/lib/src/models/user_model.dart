import 'package:user_repository/src/entities/user_entity.dart';

class MyUser {
   String userId;
   String email;
   String name;
  final bool cartIsActive;

  MyUser({
  required   this.userId,
    required this.email,
    required this.name,
    required this.cartIsActive,
  });

  static final empty = MyUser(
    userId: '',
    email: '',
    name: '',
    cartIsActive: false,
  );

  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      email: email,
      name: name,
      cartIsActive: cartIsActive,
    );
  }

 static MyUser fromEntity(UserEntity userEntity) {
    return MyUser(
      userId: userEntity.userId,
      email: userEntity.email,
      name: userEntity.name,
      cartIsActive: userEntity.cartIsActive,
    );
  }

    @override
  String toString() {
    return 'MyUser: $userId, $email, $name, $cartIsActive';
  }
}
