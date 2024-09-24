import 'package:appscrip/Model/Model_User.dart';
import 'package:appscrip/Screens/Components/Search_Area.dart';
import 'package:appscrip/Screens/Components/UserList.dart';
import 'package:appscrip/Services/User_Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = true;
  String error = '';
  bool _showSearchField = false;
  final AuthService _userFetcher = AuthService();

  Future<void> _refreshUsers() async {
    setState(() {
      isLoading = true;
      error = '';
    });
    await _userFetcher.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Appscrip',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.greenAccent),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => searchField()));
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              FutureBuilder<List<Users>>(
                  future: _userFetcher.getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      return RefreshIndicator(
                          onRefresh: _refreshUsers,
                          child: listUsers(users: snapshot.data!));
                    } else {
                      return Center(
                          child: SpinKitWave(
                        color: Colors.greenAccent,
                        type: SpinKitWaveType.start,
                      ));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
