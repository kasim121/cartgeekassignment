import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/current_booking_provider.dart';

SizedBox currentBooking(double screenHeight) {
  return SizedBox(
    child: Consumer<CurrentBookingProvider>(
      builder: (context, currentBookingConsumer, _) {
        if (currentBookingConsumer.currentBookingModel!.response!.isEmpty) {
          return const Center(
            child: Text(
              'There are no bookings available!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          );
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount:
                currentBookingConsumer.currentBookingModel!.response!.length,
            itemBuilder: (BuildContext context, int index) {
              var currentBookingData =
                  currentBookingConsumer.currentBookingModel!.response![index];
              return SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    currentBookingData.title.toString(),
                                    style: GoogleFonts.alegreyaSans(
                                      textStyle: const TextStyle(
                                        color: Color(0xFFE36DA6),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            const Color(0xFFE36DA6),
                                        minimumSize: const Size(60, 40),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: FittedBox(
                                        child: Text(
                                          'Start',
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
                              Padding(
                                padding: const EdgeInsets.only(right: 90.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'From',
                                      style: GoogleFonts.alegreyaSans(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF5C5C5C),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'To',
                                      style: GoogleFonts.alegreyaSans(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF5C5C5C),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/calendaricon.png',
                                        width: 10.0,
                                        height: 10.0,
                                        color: const Color(0xFFE36DA6),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        currentBookingData.fromDate.toString(),
                                        style: GoogleFonts.alegreyaSans(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF5C5C5C),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/calendaricon.png',
                                        width: 10.0,
                                        height: 10.0,
                                        color: const Color(0xFFE36DA6),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        currentBookingData.toDate.toString(),
                                        style: GoogleFonts.alegreyaSans(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF5C5C5C),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/clock.png',
                                        width: 10.0,
                                        height: 10.0,
                                        color: const Color(0xFFE36DA6),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        currentBookingData.fromTime.toString(),
                                        style: GoogleFonts.alegreyaSans(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF5C5C5C),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 45.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/images/clock.png',
                                          width: 10.0,
                                          height: 10.0,
                                          color: const Color(0xFFE36DA6),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          currentBookingData.toTime.toString(),
                                          style: GoogleFonts.alegreyaSans(
                                            textStyle: const TextStyle(
                                              color: Color(0xFF5C5C5C),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 25,
                                      child: TextButton.icon(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'assets/images/staricon.png',
                                            width: 10.0,
                                            height: 10.0,
                                            color: Colors.white),
                                        label: FittedBox(
                                          child: Text(
                                            'Rate Us',
                                            style: GoogleFonts.alegreyaSans(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF262F71),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: SizedBox(
                                      height: 25,
                                      child: TextButton.icon(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'assets/images/pinlocation.png',
                                            width: 10.0,
                                            height: 10.0,
                                            color: Colors.white),
                                        label: FittedBox(
                                          child: Text(
                                            'Geolocation',
                                            style: GoogleFonts.alegreyaSans(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF262F71),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: SizedBox(
                                      height: 25,
                                      child: TextButton.icon(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/radio.png',
                                          width: 10.0,
                                          height: 10.0,
                                          color: Colors.white,
                                        ),
                                        label: FittedBox(
                                          child: Text(
                                            'Surveillance',
                                            style: GoogleFonts.alegreyaSans(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF262F71),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    ),
  );
}
