import 'package:flutter/material.dart';
import 'package:the_diecast_shop_mobile/models/car_items.dart';
import 'package:the_diecast_shop_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CarEntryPage extends StatefulWidget {
  const CarEntryPage({super.key});

  @override
  State<CarEntryPage> createState() => _CarEntryPageState();
}

class _CarEntryPageState extends State<CarEntryPage> {
  Future<List<CarItems>> fetchCars(CookieRequest request) async {
    // Ganti URL dengan endpoint API JSON untuk mendapatkan daftar mobil
    final response = await request.get('http://localhost:8000/json/');

    // Decode response menjadi bentuk JSON
    var data = response;

    // Konversi data JSON menjadi objek CarItems
    List<CarItems> listCars = [];
    for (var d in data) {
      if (d != null) {
        listCars.add(CarItems.fromJson(d));
      }
    }
    return listCars;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchCars(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data mobil pada sistem.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Model Number: ${snapshot.data![index].fields.modelNumber}"),
                      const SizedBox(height: 10),
                      Text("Price: ${snapshot.data![index].fields.price}"),
                      const SizedBox(height: 10),
                      Text("Description: ${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      Text("User Reviews: ${snapshot.data![index].fields.userReviews}"),
                      const SizedBox(height: 10),
                      snapshot.data![index].fields.imageUrl.isNotEmpty
                          ? Image.network(
                              snapshot.data![index].fields.imageUrl,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : const Text("No image available"),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
