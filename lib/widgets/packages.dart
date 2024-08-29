import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/packages_list_provider.dart';

SizedBox getPackages(double screenHeight) {
  return SizedBox(
    height: screenHeight * 0.9,
    child: Consumer<PackagesProvider>(
      builder: (context, packagesConsumer, _) {
        if (packagesConsumer.packagesModel!.response!.isEmpty) {
          return const Center(
            child: Text(
              'There are no packages available!',
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
            itemCount: packagesConsumer.packagesModel!.response!.length,
            itemBuilder: (BuildContext context, int index) {
              var packagesData =
                  packagesConsumer.packagesModel!.response![index];

              Color containerColor = index % 2 == 0
                  ? const Color(0xFFF0B3CD)
                  : const Color(0xFF80ABDB);

              return Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 12),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/cal01.png',
                              width: 25.0,
                              height: 25.0,
                              color: containerColor = index % 2 == 0
                                  ? const Color(0xFFE36DA6)
                                  : const Color(0xFFFFFFFF),
                            ),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: containerColor =
                                      index % 2 == 0
                                          ? const Color(0xFFE36DA6)
                                          : const Color(0xFF0098D0),
                                  backgroundColor: containerColor =
                                      index % 2 == 0
                                          ? const Color(0xFFE36DA6)
                                          : const Color(0xFF0098D0),
                                  minimumSize: const Size(60, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {},
                                child: FittedBox(
                                  child: Text(
                                    'Book Now',
                                    style: GoogleFonts.alegreyaSans(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              packagesData.title.toString(),
                              style: GoogleFonts.alegreyaSans(
                                textStyle: const TextStyle(
                                  color: Color(0xFF262F71),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              '₹ ${packagesData.price}',
                              style: GoogleFonts.alegreyaSans(
                                textStyle: const TextStyle(
                                  color: Color(0xFF262F71),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          packagesData.desc.toString(),
                          style: GoogleFonts.alegreyaSans(
                            textStyle: const TextStyle(
                              color: Color(0xFF262F71),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    ),
  );
}
