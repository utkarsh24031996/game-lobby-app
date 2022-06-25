import 'package:hive/hive.dart';
part 'local_storage.g.dart';

@HiveType(typeId: 1)
class LoginCred {
  @HiveField(0)
  String token;
  LoginCred({
    required this.token,
  });

}
