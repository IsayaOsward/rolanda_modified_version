// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/config/theme/custom_swatch.dart';
import 'package:rolanda_modified_version/providers/token_provider.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/storage_service.dart';
import '../../providers/profile_provider.dart';
import '../../providers/theme_provider.dart';
import '../../routes/routes.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  void initState() {
    super.initState();
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    profileProvider
        .loadProfileData(); // Fetch profile data when screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorTheme = Theme.of(context).colorScheme;
    Provider.of<TokenProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorTheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: const Text("Profile"),
          automaticallyImplyLeading: false,
        ),
        body: Consumer<ProfileProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.errorMessage.isNotEmpty) {
              return const Center(
                  child: Text('Sorry!: We are unable to fetch your profile'));
            }

            final profile = provider.profile;
            if (profile == null) {
              return const Center(child: Text('No profile data available'));
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundColor: customSwatch,
                      child: CircleAvatar(
                        radius: 88,
                        backgroundImage:
                            NetworkImage("$baseUrl${profile.image!}"),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Text(
                      profile.fullName!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      thickness: 0.3,
                    ),
                    Container(
                      width: Dimensions.screenWidth,
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width20,
                          vertical: Dimensions.height10),
                      decoration: BoxDecoration(
                        color: colorTheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: null,
                            leading: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Icon(
                                Icons.mail_outline,
                                color: customSwatch,
                              ),
                            ),
                            title: Text(
                              profile.email!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            onTap: null,
                            leading: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Icon(
                                Icons.phone_outlined,
                                color: customSwatch,
                              ),
                            ),
                            title: Text(
                              profile.phone!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            onTap: null,
                            leading: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Icon(
                                Icons.location_city_outlined,
                                color: customSwatch,
                              ),
                            ),
                            title: Text(
                              profile.city!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            onTap: null,
                            leading: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Icon(
                                Icons.location_pin,
                                color: customSwatch,
                              ),
                            ),
                            title: Text(
                              profile.country!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            onTap: null,
                            leading: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Icon(
                                Icons.female_outlined,
                                color: customSwatch,
                              ),
                            ),
                            title: Text(
                              profile.gender!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                leading: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: const Icon(
                                    Icons.brightness_6,
                                    color: customSwatch,
                                  ),
                                ),
                                title: const Text(
                                  "Change theme",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                trailing: CupertinoSwitch(
                                  value: themeProvider.isDarkMode,
                                  onChanged: (value) {
                                    themeProvider.toggleTheme(value);
                                  },
                                ),
                              ),
                              ListTile(
                                onTap: () async {
                                  await StorageService().clearUserData();

                                  await Provider.of<TokenProvider>(context,
                                          listen: false)
                                      .refreshTokenStatus();

                                  Navigator.pushReplacementNamed(
                                      context, Routes.login);
                                },
                                leading: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: Colors.red[100],
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: const Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                  ),
                                ),
                                title: const Text(
                                  "Sign Out",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  toggleSwitch(value) {
    // setState(() {
    //   value = !value;
    // });
  }
}
