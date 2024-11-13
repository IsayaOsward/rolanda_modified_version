import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import '../../providers/profile_provider.dart';

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
    final theme = Theme.of(context).colorScheme;
    bool value = false;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.surfaceContainerLowest,
        body: Consumer<ProfileProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.errorMessage.isNotEmpty) {
              return Center(child: Text('Error: ${provider.errorMessage}'));
            }

            final profile = provider.profile;
            if (profile == null) {
              return const Center(child: Text('No profile data available'));
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFCA6F),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => () {},
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage("$baseUrl${profile.image!}"),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile.fullName!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  profile.email!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // More UI elements here...
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // toggleSwitch(value) {
  //   setState(() {
  //     value = !value;
  //   });
  // }
}
