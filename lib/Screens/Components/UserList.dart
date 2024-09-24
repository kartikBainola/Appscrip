import 'package:appscrip/Screens/Components/details_Screen.dart';
import 'package:flutter/material.dart';

import 'package:appscrip/Model/Model_User.dart';

class listUsers extends StatelessWidget {
  final List<Users> users;

  const listUsers({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          elevation: 2,
          child: ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailsScreen(
                              user: user,
                            )));
              }),
        );
      },
    );
  }
}
