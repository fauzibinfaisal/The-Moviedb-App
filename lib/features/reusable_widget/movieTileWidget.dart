import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_moviedb_app/components/loadingWidget.dart';
import 'package:the_moviedb_app/features/content_movie/controller/contentMovieController.dart';
import 'package:the_moviedb_app/routes/router.dart';
import 'package:the_moviedb_app/values/color.dart';
import 'package:the_moviedb_app/values/string.dart';
import 'package:the_moviedb_app/values/urls.dart';

class MovieTileModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  MovieTileModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });
}

class MovieListTile extends StatelessWidget {
  final String sectionTitle;
  final List<MovieTileModel> results;

  const MovieListTile({super.key, required this.sectionTitle, required this.results});

  @override
  Widget build(BuildContext context) {
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
                sectionTitle,
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
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: results.length,
          itemBuilder: (BuildContext context, int index) {
            var dataView = results[index];
            return InkWell(
              onTap: () {
                MyRouter.pushPageArguments("movieDetail",
                    MovieDetailArguments(dataView.id.toString()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.0.h),
                child: SizedBox(
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
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                              child: Text(
                                dataView.title,
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w600),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(6.0.h)),
                              child: CachedNetworkImage(
                                imageUrl:
                                "${Url.baseImage92}/${dataView.posterPath}",
                                placeholder: (context, url) =>
                                    Center(
                                      child: Wrap(
                                        children: const [
                                          LoadingWidget(
                                            isImage: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
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
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
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
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
}
