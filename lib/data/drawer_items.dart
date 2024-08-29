import '../models/drawer_item.dart';

class DrawerItems {
  static final home = DrawerItem(title: "Home");
  static final bookANanny = DrawerItem(title: "Book A Nanny");
  static final howItWorks = DrawerItem(title: "How It Works");
  static final whyNannyVanny = DrawerItem(title: "Why Nanny Vanny");
  static final myBooking = DrawerItem(title: "My Booking");
  static final myProfile = DrawerItem(title: "My Profile");
  static final support = DrawerItem(title: "Support");
  static final List<DrawerItem> all = [
    home,
    bookANanny,
    howItWorks,
    whyNannyVanny,
    myBooking,
    myProfile,
    support
  ];
}
