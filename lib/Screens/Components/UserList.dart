import 'package:appscrip/Screens/Components/details_Screen.dart';
import 'package:flutter/material.dart';

import '../../Model/Model_User.dart';

class userList extends StatefulWidget {
  final Users user;

  const userList({super.key, required this.user});

  @override
  State<userList> createState() => _userListState();
}

class _userListState extends State<userList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(widget.user.name),
          subtitle: Text(widget.user.email),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailsScreen(user: widget.user)));
          }),
    );
  }
}
