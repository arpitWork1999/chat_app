import 'package:chat_application/providers/shared_prefrences_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final prefService = Provider.of<SharedPrefrencesService>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${prefService.userName}"),
            Text("${prefService.fullName}"),
            Text("${prefService.email}"),
            Text("${prefService.phoneNumber}"),
            Text("${prefService.countryCode}"),
          ],
        )
      // FutureBuilder(
        //     future: prefService.loadPrefrences(),
        //     builder: (context, snapshot) {
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text("${prefService.userName}"),
        //           Text("${prefService.fullName}"),
        //           Text("${prefService.email}"),
        //           Text("${prefService.phoneNumber}"),
        //           Text("${prefService.countryCode}"),
        //         ],
        //       );
        //     })
    );
  }
}
