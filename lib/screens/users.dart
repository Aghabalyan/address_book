import 'package:address_book/screens/add_user.dart';
import 'package:address_book/screens/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:address_book/models/user.dart';

class Users extends StatefulWidget {
  const Users({super.key, required this.title});

  final String title;

  @override
  State<Users> createState() => _Users();
}

class _Users extends State<Users> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();

    User user1 = User('Aram', 'Aramyan', 18, 'Yerevan, Nor Norq 12');
    User user2 = User('Ani', 'Ananyan', 19, 'Yerevan, Kentron 10');
    User user3 = User('Artur', 'Abelyan', 34, 'Yerevan, Tumanyan 23');
    User user4 = User('Arman', 'Grigoryan', 34, 'Yerevan, Teryan 14');

    users.add(user1);
    users.add(user2);
    users.add(user3);
    users.add(user4);
  }

  void _showAddUser() async {
    final result = await Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => AddUser(),
      ),
    );
    if (result != null && result is User) {
      setState(() {
        users.add(result);
      });
    }
  }

  void _showUserDetail(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserDetail(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 8),
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                _showUserDetail(users[index]);
              },
              child: Row(
                //  return Row(
                children: [
                  const SizedBox(width: 8),
                  Image.asset(
                    'images/user.png',
                    scale: 8,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        users[index].fullName,
                        style: const TextStyle(fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        users[index].address ?? '',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddUser,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
