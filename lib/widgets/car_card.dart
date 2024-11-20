import 'package:flutter/material.dart';
import 'package:the_diecast_shop_mobile/models/car_items.dart';
import 'package:the_diecast_shop_mobile/screens/login.dart'; // Pastikan import ke LoginPage
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class CarCard extends StatelessWidget {
  final CarItems car;

  const CarCard(this.car, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${car.fields.name}!"),
            ));

          // Tambahkan opsi untuk logout
          if (car.fields.name == "Logout") {
            final response = await request.logout(
              "http://localhost:8000/auth/logout/"
            );

            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display car image if available
                car.fields.imageUrl.isNotEmpty
                    ? Image.network(
                        car.fields.imageUrl,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 100,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.directions_car,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                const SizedBox(height: 8),
                Text(
                  car.fields.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Model: ${car.fields.modelNumber}",
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Price: \$${car.fields.price}",
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  car.fields.description,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "User Reviews: ${car.fields.userReviews}",
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
