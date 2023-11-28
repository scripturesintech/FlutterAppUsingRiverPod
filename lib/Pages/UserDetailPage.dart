import 'package:flutter/material.dart';
import '../Model/User.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName+user.lastName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
              radius: 60,
            ),
            const SizedBox(height: 20),
            Text(
              '${user.firstName} ${user.lastName}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${user.email}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
