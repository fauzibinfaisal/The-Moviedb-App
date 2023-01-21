import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_moviedb_app/components/bodyBuilder.dart';
import 'package:the_moviedb_app/components/loadingWidget.dart';
import 'package:the_moviedb_app/features/movie_detail/controller/movieDetailController.dart';
import 'package:the_moviedb_app/features/movie_detail/model/movieDetailModel.dart';
import 'package:the_moviedb_app/routes/router.dart';
import 'package:the_moviedb_app/values/color.dart';
import 'package:the_moviedb_app/values/string.dart';
import 'package:the_moviedb_app/values/urls.dart';

class MovieDetailView extends StatelessWidget {
  final MovieDetailController _controller = Get.put(MovieDetailController());
  @override
  Widget build(BuildContext context) {
    return Obx(
            ()=> Scaffold(
          appBar: AppBar(
            elevation: 5,
            title: Text(
              Str.movieDetailStr,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16.0.sp,
                fontWeight: FontWeight.w600
              ),
            ),
            leading: GestureDetector(
              onTap: ()=> MyRouter.backPage(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Col.primaryColor,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: _buildBody(),
        )
    );
  }

  Widget _buildBody() {
    return BodyBuilder(
      apiRequestStatus: _controller.apiRequestStatus.value,
      colorLoading: Col.primaryColor,
      reload: () => _controller.getData(),
      child: _body(),
    );
  }

  Widget _body(){
    var dataView = _controller.movieDetailModel.value;
    return SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 220.0.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Col.darkBG,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "${Url.baseImage}/${dataView.posterPath}",
                    placeholder: (context, url) => Center(
                      child: Wrap(
                        children: const [
                          LoadingWidget(isImage: true,),
                        ],
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      Str.imgEmptyImage,
                      fit: BoxFit.cover,
                      height: 170.h,
                    ),
                    fit: BoxFit.fitHeight,
                    height: 170.h,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 170.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: contentBody(dataView),
                    )
                  ],
                ),
              ],
            )
          ],
        )
    );
  }

  Widget contentBody(MovieDetailModel dataView) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.0.h,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataView.title ?? "-",
                  style: GoogleFonts.roboto(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Col.primaryColor
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Text(
                  dataView.overview ?? "-",
                  style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0.sp
                  ),
                )
              ],
            )
        ),
        SizedBox(
          height: 5.0.sp,
        ),
        SizedBox(
          height: 15.0.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Divider(
            thickness: 2,
            color: Col.secondColor,
          ),
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 16.0.w),
          child:
          _controller.movieReviewModel.value.results.isEmpty ?
          const Text("No review yet") : reviews(),
        ),
        SizedBox(
          height: 200.0.h,
        ),
      ],
    );
  }

  Widget reviews() {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 30.0.h,
          child: Text(
            Str.review,
            style: GoogleFonts.roboto(
              color: Col.textGrey,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(
          height: 10.0.h,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _controller.movieReviewModel.value.results.length,
            itemBuilder: (BuildContext context, int index) {
              var dataView = _controller.movieReviewModel.value.results[index];
              return GestureDetector(
                child: Card(
                  elevation: 5.0,
                  color: Colors.white,
                  child: Container(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0.h),
                          child: Container(
                            width: 50.0.w,
                            height: 50.0.h,
                            padding: EdgeInsets.all(5),
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Col.primaryColor)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(300.0.h)),
                              child: dataView.authorDetails.avatarPath == null ?
                              Image.asset(
                                Str.imgEmptyImage,
                                fit: BoxFit.cover,
                                height: 60.h,
                              ):
                              CachedNetworkImage(
                                imageUrl: "${Url.baseImage92}/${dataView.authorDetails.avatarPath}",
                                placeholder: (context, url) => Center(
                                  child: Wrap(
                                    children: const [
                                      LoadingWidget(isImage: true,),
                                    ],
                                  ),
                                ),
                                errorWidget: (context, url, error) => Image.asset(
                                  Str.imgEmptyImage,
                                  fit: BoxFit.cover,
                                  height: 90.h,
                                ),
                                fit: BoxFit.cover,
                                height: 90.h,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataView.author,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0.sp,
                                      color: Colors.black),
                                ),
                                Text(
                                  "Rating : ${dataView.authorDetails.rating}",
                                  style: GoogleFonts.roboto(
                                      color: Col.primaryColor, fontSize: 12.0.sp),
                                ),
                                SizedBox(
                                  height: 5.0.h,
                                ),
                                Divider(
                                  color: Colors.grey[300],
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 5.0.h,
                                ),
                                Text(
                                  '"${dataView.content}"',
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey, fontSize: 10.0.sp),
                                ),
                                SizedBox(
                                  height: 5.0.h,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ],
    );
  }
}

