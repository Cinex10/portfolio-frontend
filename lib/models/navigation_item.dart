// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class NavigationItem {
  final String label;
  final Callback onTap;
  NavigationItem({
    required this.label,
    required this.onTap,
  });
}
