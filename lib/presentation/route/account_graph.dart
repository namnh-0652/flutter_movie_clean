import 'package:flutter_movie_clean/presentation/pages/profile/account/account_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_avatar/account_create_avatar_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_password/account_create_password_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_pin/account_create_pin_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_success/account_create_success_screen.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_usename/profile_create_username_page.dart';
import 'package:go_router/go_router.dart';

final accountGraph = [
  GoRoute(
    path: AccountPage.routeLocation,
    name: AccountPage.routeName,
    builder: (context, state) => const AccountPage(),
  ),
  GoRoute(
    path: AccountCreateAvatarPage.routeLocation,
    name: AccountCreateAvatarPage.routeName,
    builder: (context, state) => const AccountCreateAvatarPage(),
  ),
  GoRoute(
    path: ProfileCreateUserPage.routeLocation,
    name: ProfileCreateUserPage.routeName,
    builder: (context, state) => const ProfileCreateUserPage(),
  ),
  GoRoute(
    path: AccountCreatePasswordPage.routeLocation,
    name: AccountCreatePasswordPage.routeName,
    builder: (context, state) => const AccountCreatePasswordPage(),
  ),
  GoRoute(
    path: AccountCreatePinPage.routeLocation,
    name: AccountCreatePinPage.routeName,
    builder: (context, state) => const AccountCreatePinPage(),
  ),
  GoRoute(
    path: AccountCreateSuccessPage.routeLocation,
    name: AccountCreateSuccessPage.routeName,
    builder: (context, state) => const AccountCreateSuccessPage(),
  ),
];
