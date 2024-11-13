import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolanda_modified_version/config/theme/custom_swatch.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  void _toBackPage(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "About Us",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 30,
                  right: 40,
                  top: 10,
                  bottom: 50,
                ),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          normalSpan(context,'Welcome at '),
                          TextSpan(
                            text: 'Rolanda \n',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          normalSpan(context,'At '),
                          TextSpan(
                            text: 'Rolanda, ',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
                          ),
                          normalSpan(
                            context,' we strive to make sure your accommodation booking experience is enjoyable whether you\'re looking for a hotel, lodge, or apartment. Our app provides you with a comprehensive and user-friendly platform to find and book your ideal stay. ',
                          ),
                          headerSpan(context, "Our Mission"),
                          normalSpan(context,
                            "Our mission is to connect travelers with the best accommodation options while ensuring a smooth and secure booking process. Our mission is to connect travelers with the best accommodation options while ensuring a smooth and secure booking process. Our mission is to connect travelers with the best accommodation options while ensuring a smooth and secure booking process.",
                          ),
                          headerSpan(context,"What We Offer"),
                          _buildBulletPoint(context, "Wide Selection"),
                          _buildBulletPoint(context,"Easy Booking."),
                          _buildBulletPoint(context, "Secure Payments"),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 20), // Add some spacing between sections
                    Text(
                      "Get in touch with us via",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(bottom: 10),
                    //   child: getInTouchRow(
                    //     Icons.call_outlined,
                    //     const PhoneNumberWidget(
                    //         phoneNumber: "+255 755 957 514"),
                    //   ),
                    // ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: getInTouchRow(
                        Icons.language_outlined,
                        Text(
                          "www.rolanda.co.tz",
                          style: GoogleFonts.poppins(
                            // fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: getInTouchRow(
                        Icons.email_outlined,
                        Text(
                          "rolanda@mail.com",
                          style: GoogleFonts.poppins(
                            // fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                     const SizedBox(height: 20), // Add spacing before the button
                  ],
                ),
              ),
            ),
          ),
          // Go back button positioned at the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(customSwatch),
                  foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimary),
                ),
                onPressed: () => _toBackPage(context),
                child: const Text(
                  "Go back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Row getInTouchRow(IconData icon, Widget widget) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        const SizedBox(
          width: 10,
        ),
        widget,
      ],
    );
  }

  TextSpan headerSpan(context, String text) {
    return TextSpan(
      text: "\n\n$text\n",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  TextSpan normalSpan(context, String text) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.bodyMedium
    );
  }

  TextSpan _buildBulletPoint(context, String text) {
    return TextSpan(
      children: [
         const WidgetSpan(
          child: Text(
            '   • ',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
        ),
        TextSpan(
          text: '$text\n',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      ],
    );
  }
}
