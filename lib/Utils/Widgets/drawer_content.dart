import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/app_constant_env.dart';
import 'package:sports_app/Data/models/user_model.dart';
import 'package:sports_app/Services/auth_service.dart';
import 'package:sports_app/Services/firestore_service.dart';
import 'package:sports_app/Utils/CustomWidgets/custom_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Drawer(
        backgroundColor: kBlueColor,
        child: Container(
          decoration: const BoxDecoration(
            color: kWhiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: ListView(
              children: [
                if (user == null)
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          color: kDarkGreenColor,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              loginScreenPath,
                            );
                          },
                          text: 'Giris Yap',
                          shape: const LinearBorder(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          color: kGreyColor,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              signUpScreenPath,
                            );
                          },
                          text: 'Üye Ol',
                          shape: const LinearBorder(),
                        ),
                      ),
                    ],
                  ),
                //: GetUserName(user.uid),
                if (user != null)
                  Row(
                    children: [
                      Image.asset('assets/images/account.png',
                          width: 60, height: 60),
                      FutureBuilder<UserModel?>(
                        future: fireStoreService.getUserById(user.uid),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text("loading");
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else if (!snapshot.hasData ||
                              snapshot.data == null) {
                            return const Text("User not found");
                          } else {
                            return Text(
                              snapshot.data!.name.toString(),
                              style: const TextStyle(
                                fontSize:
                                    18, // İstediğiniz font büyüklüğünü burada belirleyin
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),

                const SizedBox(height: 7),
                Row(
                  children: [
                    imageButton("assets/images/video_button.jpg"),
                    const SizedBox(width: 12),
                    imageButton("assets/images/haber_button.jpg"),
                  ],
                ),
                const SizedBox(height: 7),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/mackolik_reklamsiz.jpg', // Resmin yolunu belirtin
                    height: 30, // Resmin yüksekliği
                    width: 50, // Resmin genişliği
                    alignment: Alignment.centerLeft,
                  ),
                ),
                _drawerItem(
                    onTap: () {},
                    iconData: Icons.campaign,
                    title: "Yenilikler"),
                sportsLabel(iconData: Icons.sports_soccer, title: "FUTBOL"),
                _drawerItem(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        homeScreenPath,
                      );
                    },
                    iconData: CupertinoIcons.clock,
                    title: "Canlı Sonuçlar"),

                const Divider(
                  color: Colors.grey, // Çizgi rengini ayarlayabilirsiniz
                  thickness: 1, // Çizgi kalınlığını ayarlayabilirsiniz
                  indent: 16, // Çizginin sol tarafındaki boşluk
                  endIndent: 16, // Çizginin sağ tarafındaki boşluk
                ),
                _drawerItem(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        populerLeaguePath,
                      );
                    },
                    iconData: Icons.format_list_bulleted,
                    title: "Puan Durumu"),
                _drawerItem(
                    onTap: () {},
                    iconData: CupertinoIcons.play,
                    title: "İddaa Programı"),
                _drawerItem(
                    onTap: () {}, iconData: Icons.cast, title: "TV Rehberi"),
                _drawerItem(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        myElevenPath,
                      );
                    },
                    iconData: Icons.eleven_mp,
                    title: "Benim 11'im"),
                _drawerItem(
                    onTap: () {},
                    iconData: Icons.format_list_numbered,
                    title: "UEFA Ülke ve Kulüp Puanı"),
                sportsLabel(
                    iconData: Icons.sports_baseball, title: "BASKETBOL"),
                _drawerItem(
                    onTap: () {},
                    iconData: CupertinoIcons.clock,
                    title: "Canlı Sonuçlar"),
                _drawerItem(
                    onTap: () {},
                    iconData: Icons.format_list_bulleted,
                    title: "Puan Durumu"),
                _drawerItem(
                    onTap: () {},
                    iconData: CupertinoIcons.play,
                    title: "İddaa Programı"),
                _drawerItem(
                  onTap: () {},
                  iconData: Icons.cast,
                  title: "TV Rehberi",
                ),
                const Divider(
                  color: kBlackColor,
                  endIndent: 20,
                  indent: 20,
                ),
                _drawerItem(
                  onTap: () {},
                  iconData: CupertinoIcons.settings,
                  title: "Settings",
                ),
                _drawerItem(
                  onTap: () {},
                  iconData: CupertinoIcons.info,
                  title: "Help",
                ),
                _drawerItem(
                  onTap: () async {
                    await authService.signOut(context);
                    // ignore: use_build_context_synchronously
                  },
                  iconData: Icons.logout,
                  title: "Logout",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded imageButton(String image) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  sportsLabel({required IconData iconData, required String title}) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 7,
      ),
      color: kLabelColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
        child: Row(
          children: [
            Icon(
              iconData,
              color: kWhiteColor,
              size: 22,
            ),
            const SizedBox(
              width: 35,
            ),
            Text(
              title,
              style: const TextStyle(color: kWhiteColor, fontSize: 15.0),
            )
          ],
        ),
      ),
    );
  }

  ListTile _drawerItem(
          {required VoidCallback onTap,
          required IconData iconData,
          required String title,
          Widget? trailing}) =>
      ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: kBlackColor,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: kBlackColor,
          ),
        ),
        trailing: trailing,
      );
}
