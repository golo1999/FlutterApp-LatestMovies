import 'package:flutter/widgets.dart';
import 'package:latest_movies/app_data.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({Key key}) : super(key: key);

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  void initState() {
    super.initState();
    setTransparentStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      selectedMovie.largeCoverImage,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
