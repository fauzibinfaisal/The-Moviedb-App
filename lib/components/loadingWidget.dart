import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_moviedb_app/values/color.dart';

class LoadingWidget extends StatelessWidget {
  final bool isImage;
  final Color color;

  const LoadingWidget({super.key, this.isImage = false, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (isImage) {
      return SpinKitRipple(
        color: Col.primaryColor,
      );
    } else {
      return SpinKitThreeBounce(
        color: color,
      );
    }
  }
}
