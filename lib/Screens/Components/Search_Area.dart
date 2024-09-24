import 'dart:convert';
import 'package:appscrip/Screens/Components/UserList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../../Model/Model_User.dart';

class searchField extends StatefulWidget {
  const searchField({super.key});

  @override
  State<searchField> createState() => _searchFieldState();
}

class _searchFieldState extends State<searchField> {
  List<Users> users = [];
  List<Users> filteredUsers = []; // List for filtered results
  String searchText = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        setState(() {
          users = data.map((user) => Users.fromJson(user)).toList();
          filteredUsers = users; // Initialize filteredUsers with all users
          filterUsers(); // Initial filtering
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error fetching users: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterUsers() {
    filteredUsers = users
        .where((user) =>
            user.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search User',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.upgrade)),
          IconButton(
              onPressed: () {
                setState(() {
                  searchText = '';
                  filterUsers(); // Reset filtering
                });
              },
              icon: Icon(Icons.clear_outlined))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "Search by name"),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                  filterUsers();
                });
              },
            ),
          ),
          Expanded(
              child: isLoading
                  ? const Center(
                      child: SpinKitThreeInOut(
                      color: Colors.greenAccent,
                    ))
                  : ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = filteredUsers[index];
                        return;
                      }))
        ],
      ),
    );
  }
}
