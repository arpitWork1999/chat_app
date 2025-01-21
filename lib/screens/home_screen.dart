import 'package:chat_application/providers/shared_prefrences_provider.dart';
import 'package:chat_application/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _loadPreferencesFuture;

  @override
  void initState() {
    super.initState();
    final prefService =
        Provider.of<SharedPrefrencesService>(context, listen: false);
    _loadPreferencesFuture = prefService.loadPrefrences();
  }

  @override
  Widget build(BuildContext context) {
    final prefService = Provider.of<SharedPrefrencesService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Home")),
      ),
      body: FutureBuilder(
        future: _loadPreferencesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Username: ${prefService.userName}"),
                Text("Full Name: ${prefService.fullName}"),
                Text("Email: ${prefService.email}"),
                Text("Phone Number: ${prefService.phoneNumber}"),
                Text("Country Code: ${prefService.countryCode}"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                  child: ElevatedButton(
                      onPressed: (){
                        prefService.logout(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "Log Out",
                        style: TextStyle(fontSize: 16),
                      )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
