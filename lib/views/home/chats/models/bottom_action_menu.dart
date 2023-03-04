import 'package:flutter/material.dart';

class BottomActionMenu {
  IconData icon;
  Color color;
  Function()? onclick;
  BottomActionMenu({required this.icon, required this.color, this.onclick});
}
