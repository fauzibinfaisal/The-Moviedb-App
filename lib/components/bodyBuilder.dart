import 'package:flutter/material.dart';
import 'package:the_moviedb_app/components/errorWidget.dart';
import 'package:the_moviedb_app/components/loadingWidget.dart';

import 'package:the_moviedb_app/utilities/apiRequestStatus.dart';

class BodyBuilder extends StatelessWidget {
  final APIRequestStatus apiRequestStatus;
  final Widget child;
  final Color colorLoading;
  final Function reload;

  const BodyBuilder(
      {
        super.key, required this.apiRequestStatus,
        required this.child,
        this.colorLoading = Colors.white,
        required this.reload
      }
      );

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loading:
        return LoadingWidget(color: colorLoading,);
        break;
      case APIRequestStatus.unInitialized:
        return LoadingWidget(color: colorLoading,);
        // return Container();
        break;
      case APIRequestStatus.connectionError:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: true,
        );
        break;
      case APIRequestStatus.error:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: false,
        );
        break;
      case APIRequestStatus.loaded:
        return child;
        break;
      default:
        return LoadingWidget(color: colorLoading,);
    }
  }
}
