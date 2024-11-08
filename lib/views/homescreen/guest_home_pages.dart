import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/image_assets.dart';

class GuestHomePages extends StatefulWidget {
  const GuestHomePages({super.key});

  @override
  State<GuestHomePages> createState() => _GuestHomePagesState();
}

class _GuestHomePagesState extends State<GuestHomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rolanda"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(ImageAssets.notification),
          ),
        ],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Discover your"), Text("perfect place to stay")],
            ),
          ),
        ),
      ),
    );
  }
}
