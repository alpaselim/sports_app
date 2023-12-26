import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/auth_service.dart';
import 'package:sports_app/Utils/Widgets/drawer_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "mackolik",
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: kWhiteColor),
            onPressed: () async {
              await authService.signOut(context);
              // ignore: use_build_context_synchronously
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}






/*return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.black),
              onPressed: () async {
                await authService.signOut(context);
                // ignore: use_build_context_synchronously
              },
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: streamService.callUsers(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                UserModel data = document.data()! as UserModel;
                return ListTile(
                  title: Text(data.name.toString()),
                  subtitle: Text(data.email.toString()),
                );
              }).toList(),
            );
          },
        )); */