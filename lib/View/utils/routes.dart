import 'package:recycle_app/View/postcode_form/postcode_form.dart';
import 'package:recycle_app/View/map_screen/filter_page.dart';
import 'package:recycle_app/View/navigation_bar/navigation_bar.dart';
import 'package:recycle_app/View/recycle_guide_page/pages/recycle_guide.dart';
import 'package:recycle_app/View/map_screen/map_screen.dart';
import 'package:recycle_app/View/setting_page/about_us/about_us.dart';
import 'package:recycle_app/View/setting_page/contact_us/contact_us.dart';
import 'package:recycle_app/View/setting_page/faqs/faqs.dart';
import 'package:recycle_app/View/setting_page/message/message_page.dart';
import 'package:recycle_app/View/setting_page/postcode_change.dart';

class AppRoutes {
  static const initialRoute = '/';

  static const fiterationPage = '/fiterationpage';

  static const messagePage = '/messagepage';

  static const recycleGuide = '/recycleguide';

  static const navigationBar = '/navigationbar';

  static const postCodeChange = '/postcodechange';

  static const aboutUs = '/aboutus';

  static const contactUs = '/contactus';

  static const faqs = '/faqs';

  static const map = '/map';
}

var routes = {
  AppRoutes.initialRoute: (context) => const PostCodeForm(),
  AppRoutes.fiterationPage: (context) => const FilterationPage(),
  AppRoutes.messagePage: (context) => const MessagePage(),
  AppRoutes.recycleGuide: (context) => const RecycleGuideScreen(),
  AppRoutes.navigationBar: (context) => const NavigationBottomBar(),
  AppRoutes.postCodeChange: (context) => const ChangePostCode(),
  AppRoutes.aboutUs: (context) => const AboutUs(),
  AppRoutes.contactUs: (context) => const ContactUs(),
  AppRoutes.faqs: (context) => const FAQs(),
  AppRoutes.map: (context) => const LocationScreen(),
};
