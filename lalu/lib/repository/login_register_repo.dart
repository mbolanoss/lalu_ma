import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/models/user_register.dart';

class LoginRegisterRepo {
  Future<QueryResult> registerUser(
      GraphQLClient client, UserRegister user) async {
    const mutation = r"""
      mutation NewUser($user: UserInput!){
        createUser(user: $user)
      }
    """;

    final MutationOptions options =
        MutationOptions(document: gql(mutation), variables: <String, dynamic>{
      "user": <String, dynamic>{
        "first_name": user.firstName,
        "second_name": user.lastName,
        "user_name": user.username,
        "email": user.email,
        "user_password": user.password,
        "confirm_password": user.confirmPassword,
        "birth": user.birthDate,
      }
    });

    return client.mutate(options);
  }
}
