import 'dart:ui';
import 'package:flutter/services.dart';

import 'movie.dart';

const String applicationTitle = 'Latest movies';
const Color primaryColor = Color(0xff101820);
const Color secondaryColor = Color(0xfff2aa4c);
const Color whiteColor = Color(0xffffffff);
const Color transparentColor = Color(0x00000000);

Movie selectedMovie;

void setTransparentStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: transparentColor,
    ),
  );
}
