import 'package:cartgeek/data/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/emilyprofile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Text(
              'Emily Cyrus',
              style: GoogleFonts.alegreyaSans(
                textStyle: const TextStyle(
                  color: Color(0xFFE36DA6),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDrawerItems(context),
        ],
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: DrawerItems.all.asMap().entries.map(
          (entry) {
            int index = entry.key;
            var item = entry.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
                  child: Text(
                    item.title,
                    style: GoogleFonts.alegreyaSans(
                      textStyle: const TextStyle(
                        color: Color(0xFF262F71),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                if (index < DrawerItems.all.length - 1)
                  const Padding(
                    padding: EdgeInsets.only(right: 180.0, left: 20),
                    child: Divider(
                      color: Color(0xFFE36DA6),
                      thickness: 0.2,
                    ),
                  ),
              ],
            );
          },
        ).toList(),
      );
}
