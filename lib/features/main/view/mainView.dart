
import 'package:the_moviedb_app/components/dialogs.dart';
import 'package:the_moviedb_app/features/content_movie/view/contentMovieView.dart';
import 'package:the_moviedb_app/features/main/controller/mainController.dart';
import 'package:the_moviedb_app/features/profile/view/profileView.dart';
import 'package:the_moviedb_app/features/television/view/tvView.dart';
import 'package:the_moviedb_app/values/string.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  final MainController _controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Obx(
            ()=> WillPopScope(
            child: Scaffold(
              body: Stack(
                children: [
                  PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller.pageController,
                    onPageChanged: _controller.onPageChanged,
                    children: <Widget>[
                      ContentMovieView(),
                      TvView(),
                      ProfileView(),
                    ],
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Image.asset(Str.imgNacIcon1),
                      activeIcon:Image.asset(Str.imgNacIcon1A),
                      label: Str.movie,),
                  BottomNavigationBarItem(
                    icon: Image.asset(Str.imgNacIcon2),
                    activeIcon:Image.asset(Str.imgNacIcon2A),
                    label: Str.tv,),
                  BottomNavigationBarItem(
                    icon: Image.asset(Str.imgNacIcon3),
                    activeIcon:Image.asset(Str.imgNacIcon3A),
                    label: Str.profile,),
                ],
                currentIndex: _controller.indexBottomNavigation.value,
                showUnselectedLabels: true,
                elevation: 20,
                onTap: (index){
                  print(index);
                  _controller.navigationTapped(index);
                },
              ),
            ),
            onWillPop:  () => Dialogs().showExitDialog(context)
        )
    );
  }

}
