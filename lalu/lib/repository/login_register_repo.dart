import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/models/user_register.dart';

class LoginRegisterRepo {
  Future<QueryResult> registerUser(
      GraphQLClient client, UserRegister user) async {
    const mutation = r"""
      mutation NewUser($user: UserInput!, $username: String!){
        createUser(user: $user)
        createUserConfig(username: $username)
        createLikedArtistsList(username: $username)
        createPlayedSongsList(username: $username)
      }
    """;

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: <String, dynamic>{
        "user": <String, dynamic>{
          "first_name": user.firstName,
          "second_name": user.lastName,
          "user_name": user.username,
          "email": user.email,
          "user_password": user.password,
          "confirm_password": user.confirmPassword,
          "birth": user.birthDate,
        },
        "username": user.username,
      },
    );

    return client.mutate(options);
  }

  Future<QueryResult> login(GraphQLClient client, String username,
      String password, String email) async {
    const mutation = r"""
      mutation LoginUser($login: LoginInput!) {
        loginUser(login: $login)
      }
    """;

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: <String, dynamic>{
        "login": {
          "user_name": username,
          "email": email,
          "user_password": password,
        },
      },
    );

    return client.mutate(options);
  }
}
