import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_moviedb_app/components/bodyBuilder.dart';
import 'package:the_moviedb_app/components/loadingWidget.dart';
import 'package:the_moviedb_app/features/content_movie/controller/contentMovieController.dart';
import 'package:the_moviedb_app/features/main/controller/mainController.dart';
import 'package:the_moviedb_app/features/reusable_widget/movieTileWidget.dart';
import 'package:the_moviedb_app/features/television/controller/tvController.dart';
import 'package:the_moviedb_app/values/color.dart';
import 'package:the_moviedb_app/values/string.dart';
import 'package:the_moviedb_app/values/urls.dart';

class TvView extends StatelessWidget {
  final TvController
  _controller =
  Get.put(TvController());
  final MainController controllerMainScreen = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        backgroundColor: Col.primaryColor,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BodyBuilder(
      apiRequestStatus: _controller.apiRequestStatus.value,
      reload: () => _controller.getDataTV(),
      child: _body(),
    );
  }

  Widget _body() {
    return RefreshIndicator(
      onRefresh: () => _controller.getDataTV(),
      child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.w, horizontal: 10.0.h),
              child: Row(
                children: [
                  Flexible(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child:
                              Text("${Str.tvIc} ",
                                style: GoogleFonts.roboto(
                                  fontSize: 20.0.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),),
                            SizedBox(
                              width: 5.0.w,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: contentBody(),
            )
          ],
        ),
      ),
    );
  }

  Widget contentBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.0.h,
        ),
        MovieListTile(
          sectionTitle: Str.onTheAir,
          results: _controller.tvOnAirModel,
        ),
        SizedBox(
          height: 15.0.h,
        ),
        SizedBox(
          width: Get.width,
          height: 2.0.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.h),
            child: Container(
              color: Col.secondColor,
            ),
          ),
        ),
        SizedBox(
          height: 20.0.h,
        ),
        MovieListTile(
          sectionTitle: Str.popular,
          results: _controller.tvPopularModel,
        ),
        SizedBox(
          height: 50.0.h,
        ),
      ],
    );
  }
}
