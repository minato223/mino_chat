import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/models/user.dart';

class UserFixtures {
  static List<User> get allUser => [
        User(
            username: "Awa Diabaté",
            profil: AppImages.avatar2,
            lastConnexion: 12,
            description: "Et dolore commodo id commodo.",
            unreadMessage: 2),
        User(
            username: "Richard Hendricks",
            profil: AppImages.avatar3,
            lastConnexion: 12,
            description:
                "Et cillum Lorem ex velit sit nulla velit cillum veniam.",
            unreadMessage: 7),
        User(
            username: "Leonard",
            profil: AppImages.avatar4,
            lastConnexion: 12,
            unreadMessage: 0,
            description:
                "Consequat enim amet ut laborum Lorem eu ipsum consectetur eu et laborum nostrud cillum fugiat."),
        User(
            username: "Horizon",
            profil: AppImages.avatar7,
            lastConnexion: 12,
            unreadMessage: 3,
            description:
                "Labore adipisicing reprehenderit ut qui nulla ea duis Lorem esse duis."),
        User(
            username: "Wattson",
            profil: AppImages.avatar5,
            lastConnexion: 12,
            description:
                "Officia do Lorem ipsum nisi magna sint consectetur reprehenderit irure anim."),
        User(
            username: "Lifeline",
            profil: AppImages.avatar1,
            lastConnexion: 12,
            description: "Mollit anim est Lorem et incididunt in esse mollit."),
        User(
            username: "Howard",
            profil: AppImages.avatar6,
            lastConnexion: 12,
            description: "Quis aute occaecat Lorem pariatur eu ea."),
        User(
            username: "Myriam",
            profil: AppImages.avatar8,
            unreadMessage: 1,
            lastConnexion: 12,
            description: "Enim enim amet enim excepteur."),
      ];
}
