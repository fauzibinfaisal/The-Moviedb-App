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
      child: _body(),
      reload: () => _controller.getDataMovie(),
    );
  }

  Widget _body() {
    return RefreshIndicator(
      onRefresh: () => _controller.getDataMovie(),
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
        tvOnAirListView(),
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
        tvPopularListView(),
        SizedBox(
          height: 50.0.h,
        ),
      ],
    );
  }

  Widget tvOnAirListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                child: Text(
                  Str.nowPlaying,
                  style: GoogleFonts.roboto(
                    fontSize: Get.textTheme.bodyText1?.fontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        SizedBox(
          height: 230.0.h,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _controller.tvOnAirModel.value?.results?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var dataView = _controller.tvOnAirModel.value.results[index];
              bool show = true;
              return Visibility(
                  visible: show,
                  child: InkWell(
                    onTap: () {
                      // MyRouter.pushPageArguments("detailDoctorPage", DetailDoctorArguments(dataView.id.toString()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                      child: Container(
                        width: 140.w,
                        child: Column(
                          children: [
                            Flexible(
                              flex: 5,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 8.0.h,
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      dataView.name,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 11.0.sp,
                                          fontWeight: FontWeight.w600
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),),
                                  SizedBox(
                                    height: 4.0.h,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    child: CachedNetworkImage(
                                      imageUrl: "${Url.baseImage}/${dataView.posterPath}",
                                      placeholder: (context, url) => Center(
                                        child: Wrap(
                                          children: [
                                            LoadingWidget(isImage: true,),
                                          ],
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Image.asset(
                                        Str.imgEmptyImage,
                                        fit: BoxFit.cover,
                                        height: 130.h,
                                      ),
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        dataView.overview,
                                        style: GoogleFonts.roboto(
                                          color: Col.textGrey,
                                          fontSize: 10.sp,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }

  Widget tvPopularListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                child: Text(
                  Str.upcoming,
                  style: GoogleFonts.roboto(
                    fontSize: Get.textTheme.bodyText1?.fontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        SizedBox(
          height: 230.0.h,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _controller.tvPopularModel.value?.results?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var dataView = _controller.tvPopularModel.value.results[index];
              bool show = true;
              return Visibility(
                  visible: show,
                  child: InkWell(
                    onTap: () {
                      // MyRouter.pushPageArguments("detailDoctorPage", DetailDoctorArguments(dataView.id.toString()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                      child: Container(
                        width: 140.w,
                        child: Column(
                          children: [
                            Flexible(
                              flex: 5,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 8.0.h,
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      dataView.name,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 11.0.sp,
                                          fontWeight: FontWeight.w600
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),),
                                  SizedBox(
                                    height: 4.0.h,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    child: CachedNetworkImage(
                                      imageUrl: "${Url.baseImage}/${dataView.posterPath}",
                                      placeholder: (context, url) => Center(
                                        child: Wrap(
                                          children: [
                                            LoadingWidget(isImage: true,),
                                          ],
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Image.asset(
                                        Str.imgEmptyImage,
                                        fit: BoxFit.cover,
                                        height: 130.h,
                                      ),
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        dataView.overview,
                                        style: GoogleFonts.roboto(
                                          color: Col.textGrey,
                                          fontSize: 10.sp,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }




}
