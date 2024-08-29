import 'package:cartgeek/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/current_booking_provider.dart';
import 'providers/packages_list_provider.dart';
import 'screens/navscreens/booking_screens.dart';
import 'screens/navscreens/home_screen.dart';
import 'screens/navscreens/packages_screen.dart';
import 'screens/navscreens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PackagesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentBookingProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'CartGeek',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 247, 244, 244),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen> {
  late double xOffSets = 180;
  late double yOffSets = 110;
  late double scalFactor = 0.6;
  late bool isDragging = false;
  late bool isDrawerOpen;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    closeDrawer();
    pages = [
      HomeScreen(openDrawer: openDrawer),
      const PackagesScreen(),
      const BookingsScreen(),
      const ProfileScreen(),
    ];
  }

  void closeDrawer() => setState(() {
        xOffSets = 0;
        yOffSets = 0;
        scalFactor = 1;
        isDrawerOpen = false;
      });

  void openDrawer() => setState(() {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;

        xOffSets = width * 0.6;
        yOffSets = height * 0.12;
        scalFactor = 0.9;
        isDrawerOpen = true;
      });

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
      closeDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          buildDrawer(),
          buildScreen(context),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 12,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFFE36DA6),
        unselectedItemColor: const Color(0xFF5C5C5C),
        selectedLabelStyle: GoogleFonts.alegreyaSans(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.alegreyaSans(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_nav_icon.png',
              width: 25.0,
              height: 25.0,
              color: const Color(0xFFD84D90),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/package_nav_icon.png',
              width: 25.0,
              height: 25.0,
              color: const Color(0xFFD84D90),
            ),
            label: "Packages",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/booking_nav_icon.png',
              width: 25.0,
              height: 25.0,
              color: const Color(0xFFD84D90),
            ),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user_nav_icon.png',
              width: 25.0,
              height: 25.0,
              color: const Color(0xFFD84D90),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget buildDrawer() => const SafeArea(child: DrawerWidget());

  Widget buildScreen(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: closeDrawer,
          onHorizontalDragStart: (details) => isDragging = true,
          onHorizontalDragUpdate: (details) {
            if (!isDragging) return;
            const delta = 1;
            if (details.delta.dx > delta) {
              openDrawer();
            } else if (details.delta.dx < -delta) {
              closeDrawer();
            }
            isDragging = false;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffSets, yOffSets, 0)
              ..scale(scalFactor),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: isDrawerOpen
                  ? BorderRadius.circular(12.0)
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: pages[currentIndex],
            ),
          ),
        );
      },
    );
  }
}
