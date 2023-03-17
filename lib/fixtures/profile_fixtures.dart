import 'package:flutter/material.dart';
import 'package:mino_chat/views/profile/models/profile_tile_model.dart';

class ProfileFixtures {
  static List<ProfileTileModel> get getTiles => [
        ProfileTileModel(
            icon: Icons.supervised_user_circle, name: "Personal Data"),
        ProfileTileModel(icon: Icons.settings_rounded, name: "Settings"),
        ProfileTileModel(icon: Icons.feed_outlined, name: "E-Statement"),
        ProfileTileModel(icon: Icons.favorite_rounded, name: "Refferal Code"),
        ProfileTileModel(icon: Icons.question_mark_rounded, name: "FAQ"),
        ProfileTileModel(icon: Icons.edit_outlined, name: "Our Handbook"),
        ProfileTileModel(icon: Icons.people, name: "Community"),
      ];
}
