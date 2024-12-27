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

if (car.fields.name == "Logout") {
  debugPrint("Logout button pressed"); // Debug
  try {
    final response = await request.logout(
      "http://localhost:8000/auth/logout/",
    );

    debugPrint("Logout response: $response"); // Debug
    if (response['status']) {
      debugPrint("Logout successful"); // Debug
      String uname = response["username"] ?? "User";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${response["message"]} Sampai jumpa, $uname."),
      ));

      if (context.mounted) {
        debugPrint("Navigating to LoginPage"); // Debug
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false,
        );
      }
    } else {
      debugPrint("Logout failed: ${response["message"]}"); // Debug
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response["message"] ?? "Gagal logout. Coba lagi."),
      ));
    }
  } catch (e) {
    debugPrint("Logout exception: $e"); // Debug
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Terjadi kesalahan saat logout: $e"),
    ));
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
