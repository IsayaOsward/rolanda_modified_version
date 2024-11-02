// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Capture',
      'preSubtitle': "Issues",
      'subtitle': 'Instantly',
      'description': 'Use built-in camera features to document property conditions and ensure timely, accurate reporting.',
      'image': 'assets/images/welcome.jpg',
    },
    {
      'title': 'Real-Time',
      'preSubtitle': "Maintenace",
      'subtitle': 'Tracking',
      'description': 'Receive notifications for updates and get instant access to all details.',
      'image': 'assets/images/welcome.jpg',
    },
    {
      'title': 'Effortless',
      'preSubtitle': "Occupancy",
      'subtitle': 'Verification',
      'description': 'Organize, edit, and share reports with just a few taps.',
      'image': 'assets/images/welcome.jpg',
    },
    {
      'title': 'Connected',
      'preSubtitle': "and",
      'subtitle': 'Informed',
      'description': 'Receive notifications for updates and get instant access to all details.',
      'image': 'assets/images/welcome.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
            itemCount: onboardingData.length,
            itemBuilder: (context, index, realIndex) {
              return buildCarouselPage(
                context,
                onboardingData[index]['title']!,
                onboardingData[index]['preSubtitle']!,
                onboardingData[index]['subtitle']!,
                onboardingData[index]['description']!,
                onboardingData[index]['image']!,
              );
            },
          ),
          Positioned(
            bottom: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => buildIndicator(index == _currentIndex),
              ),
            ),
          ),
          Positioned(
            bottom: 65,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
                      foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface),
                    ),
                    child: const Text("SIGN IN"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary.withOpacity(0.36)),
                      foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surface),
                    ),
                    child: const Text("ENTER AS A GUEST"),
                  ),
                ],
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "By continuing you agree to the Terms of\nServices & Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).colorScheme.surface),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselPage(BuildContext context, String title, String preSubtitle, String subtitle, String description, String image) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.6),
        ),
        Align(
          alignment: const Alignment(0,0.6),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      preSubtitle,
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).colorScheme.surface,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      subtitle,
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      height: 5,
      width: 24 ,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).colorScheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
