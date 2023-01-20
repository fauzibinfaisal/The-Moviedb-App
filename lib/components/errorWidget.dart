import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_moviedb_app/values/string.dart';
import 'package:the_moviedb_app/values/color.dart';


class MyErrorWidget extends StatelessWidget {
  final Function refreshCallBack;
  final bool isConnection;

  const MyErrorWidget({super.key, required this.refreshCallBack, this.isConnection = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            Str.emoticon,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(50.0.sp),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.0),
            child: Text(
              getErrorText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red[600],
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12.0),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () => refreshCallBack,

              child: Text(
                Str.tryAgain,
                style: TextStyle(
                  color: Col.primaryColor,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getErrorText() {
    if (isConnection) {
      return '${Str.connectionError}';
    } else {
      return '${Str.problem}';
    }
  }
}
