import 'package:flutter/material.dart';
import 'package:sea_battle_domain/domain/user.dart';
import 'package:sea_battle_presentation/service/abstraction/user_service.dart';

class HomePage extends StatelessWidget {
  final UserService _userService;

  const HomePage({
    Key? key,
    required UserService userService
  }):
    _userService = userService,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example")),
      body: FutureBuilder<User?>(
        future: _userService.findUserByNickname("andrii"),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.id.toString());
          } else {
            return const Text("No data");
          }
        }
      ),
    );
  }
}