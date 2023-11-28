import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myuserapp/Network/api_service.dart';
import 'package:myuserapp/pages/UserDetailPage.dart';
import '../Model/User.dart';

final apiProvider = Provider<APIService>((ref) => APIService(),
);

final userDataProvider = FutureProvider<List<User>>((ref) {
  return ref.read(apiProvider).getUser();
},);

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const  Text('Users'),
      ),
      body: userData.when(
          data: (data) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                return ListTile(
                  title:
                  Text("${data[index].firstName} ${data[index].lastName}"),
                  subtitle: Text(data[index].email),
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: ClipOval(
                        child: SizedBox(
                            width: 120.0,
                            height: 120.0,
                            child: Image.network(data[index].avatar))),
                  ),
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => UserDetailPage(data[index]),
                    ),
                    );
                  },
                );
              }),
              itemCount: data.length,
            );
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: (() {
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}