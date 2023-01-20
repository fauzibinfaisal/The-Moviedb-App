import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_moviedb_app/components/customAlert.dart';
import 'package:the_moviedb_app/values/string.dart';

class Dialogs {
  showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlert(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0.h),
              Text(
                Str.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0.sp,
                ),
              ),
              SizedBox(height: 25.0.h),
              Text(
                'Are you sure you want to quit?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0.sp,
                ),
              ),
              SizedBox(height: 40.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40.0.h,
                    width: 130.0.h,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Theme.of(context).accentColor), // HERE
                          ),
                          side: BorderSide(color: Colors.white)), //
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),

                    ),
                  ),
                  Container(
                    height: 40.0.h,
                    width: 130.0.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => exit(0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0.h),
            ],
          ),
        ),
      ),
    );
  }
}
