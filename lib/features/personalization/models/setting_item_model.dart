import 'package:flutter/material.dart';

class SettingItemModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? trailing;
  final void Function()? onTap;

  const SettingItemModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.trailing,
    this.onTap,
  });
}
