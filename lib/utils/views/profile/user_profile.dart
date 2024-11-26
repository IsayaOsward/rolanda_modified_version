// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/config/theme/custom_swatch.dart';
import 'package:rolanda_modified_version/providers/token_provider.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/image_assets.dart';
import 'package:rolanda_modified_version/utils/storage_service.dart';
import '../../../providers/profile_provider.dart';
import '../../../providers/theme_provider.dart';
import '../../../routes/routes.dart';

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
    profileProvider.loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorTheme = Theme.of(context).colorScheme;

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
                        backgroundImage: profile.image != null
                            ? NetworkImage("$baseUrl${profile.image!}")
                            : const AssetImage(ImageAssets.profileImage)
                                as ImageProvider,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Text(
                      profile.fullName ?? "N/A",
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
                          _buildListTile(
                            icon: Icons.mail_outline,
                            title: profile.email ?? "N/A",
                          ),
                          _buildListTile(
                            icon: Icons.phone_outlined,
                            title: profile.phone ?? "N/A",
                          ),
                          _buildListTile(
                            icon: Icons.location_city_outlined,
                            title: profile.city ?? "N/A",
                          ),
                          _buildListTile(
                            icon: Icons.location_pin,
                            title: profile.country ?? "N/A",
                          ),
                          _buildListTile(
                            icon: Icons.female_outlined,
                            title: profile.gender ?? "N/A",
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

  Widget _buildListTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Icon(
          icon,
          color: customSwatch,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
