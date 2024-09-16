import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF1A1D3A),
              Color(0xFF302C6B),
              Color(0xFF5B2586),
            ],
            transform: GradientRotation(32),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage("lib/assets/images/apple.png"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.99),
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.black),
                    title: Text('My Orders'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Handle My Orders tap
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.card_giftcard, color: Colors.black),
                    title: Text('Refer and Earn'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Handle Refer and Earn tap
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help_center, color: Colors.black),
                    title: Text('Help Center'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Handle Help Center tap
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.edit, color: Colors.black),
                    title: Text('Edit Profile Details'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Handle Edit Profile Details tap
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.black),
                    title: Text('Settings'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Handle Settings tap
                    },
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
