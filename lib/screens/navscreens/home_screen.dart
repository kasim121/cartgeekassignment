import 'package:cartgeek/models/booking_list_model.dart';
import 'package:cartgeek/providers/packages_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/current_booking_provider.dart';
import '../../widgets/current_booking.dart';
import '../../widgets/packages.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const HomeScreen({super.key, required this.openDrawer});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<PackagesProvider>(context, listen: false).getPackagesAPI();
    Provider.of<CurrentBookingProvider>(context, listen: false)
        .getCurrentBookingAPI();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: screenHeight,
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: widget.openDrawer,
                            icon: Image.asset(
                              'assets/images/menuicon.png',
                              width: screenWidth * 0.06,
                              height: screenWidth * 0.06,
                              color: const Color(0xFFE36DA6),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: screenWidth * 0.14,
                            height: screenWidth * 0.14,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/emilyprofile.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: GoogleFonts.alegreyaSans(
                                  textStyle: TextStyle(
                                    color: const Color(0xfF5C5C5C),
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                'Emily Cyrus',
                                style: GoogleFonts.alegreyaSans(
                                  textStyle: TextStyle(
                                    color: const Color(0xFFE36DA6),
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: screenHeight * 0.04),
                            child: Container(
                              width: double.infinity,
                              height: screenHeight * 0.18,
                              decoration: BoxDecoration(
                                color: const Color(0xffF0B3CD),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: screenHeight * 0.02,
                                    top: screenHeight * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nanny And',
                                      style: GoogleFonts.alegreyaSans(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF262F71),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Babysitting services',
                                      style: GoogleFonts.alegreyaSans(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF262F71),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.025,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              const Color(0xFF262F71),
                                          minimumSize: Size(screenWidth * 0.15,
                                              screenHeight * 0.06),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: FittedBox(
                                          child: Text(
                                            'Book Now',
                                            style: GoogleFonts.alegreyaSans(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -screenHeight * 0.070,
                            right: -screenWidth * 0.005,
                            child: Image.asset(
                              'assets/images/caretaker.png',
                              width: screenHeight * 0.4,
                              height: screenHeight * 0.3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        'Your Current Booking',
                        style: GoogleFonts.alegreyaSans(
                          textStyle: const TextStyle(
                            color: Color(0xFF262F71),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      currentBooking(screenHeight),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        'Packages',
                        style: GoogleFonts.alegreyaSans(
                          textStyle: const TextStyle(
                            color: Color(0xFF262F71),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 90.0),
                        child: getPackages(screenHeight),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
