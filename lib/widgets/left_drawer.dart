import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productslist_form.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import 'package:football_shop/screens/login.dart';        // ⬅ Pastikan ini ada
import 'package:provider/provider.dart';                 
import 'package:pbp_django_auth/pbp_django_auth.dart';   // ⬅ Untuk request.logout()

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>(); // untuk logout

    return Drawer(
      backgroundColor: Colors.orange.shade50,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange.shade700,
                  Colors.orange.shade500,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 6),
                Text(
                  'Football Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Seluruh produk ada disini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),

          // ==========================
          // Home
          // ==========================
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Colors.orange.shade900,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),

          // ==========================
          // Product List
          // ==========================
          ListTile(
            leading: Icon(
              Icons.list_alt_rounded,
              color: Colors.orange.shade900,
            ),
            title: Text(
              'Product List',
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryListPage(
                    endpointUrl: "http://localhost:8000/json/",
                    pageTitle: "All Products",
                  ),
                ),
              );
            },
          ),

          // ==========================
          // Add Product
          // ==========================
          ListTile(
            leading: Icon(
              Icons.add_circle_outline,
              color: Colors.orange.shade900,
            ),
            title: Text(
              'Add Product',
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductsFormPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 10),
          const Divider(),

          // ==========================
          // LOGOUT (BARU DITAMBAHKAN)
          // ==========================
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            onTap: () async {
              // jalankan logout ke server Django
              await request.logout("http://localhost:8000/auth/logout/");

              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
