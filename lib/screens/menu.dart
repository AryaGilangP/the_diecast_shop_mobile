import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_diecast_shop_mobile/widgets/left_drawer.dart';
import 'package:the_diecast_shop_mobile/screens/carentry_form.dart';
import 'package:the_diecast_shop_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306221970';
  final String name = 'Arya Gilang Prasetya';
  final String className = 'PBP F';

  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("View Cars", Icons.directions_car),
    ItemHomepage("Add Car", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fufufafa Shop Mobile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Color.fromARGB(133, 100, 165, 235)),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to The Diecast Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return CarCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

class CarCard extends StatelessWidget {
  final ItemHomepage item;

  const CarCard(this.item, {super.key});

  Color _getItemColor() {
    switch (item.name) {
      case "View Cars":
        return Colors.yellow;
      case "Add Car":
        return Colors.blue;
      case "Logout":
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getItemColor(),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          if (item.name == "Logout") {
            final request = context.read<CookieRequest>();
            try {
              final response = await request.logout(
                "http://localhost:8000/auth/logout/",
              );

              if (response['status']) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${response['message']} Logout berhasil."),
                ));
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(response['message'] ?? "Gagal logout."),
                ));
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Terjadi kesalahan: $e"),
              ));
            }
          } else if (item.name == "Add Car") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CarEntryFormPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("You pressed the ${item.name} button!"),
            ));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const SizedBox(height: 4),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
