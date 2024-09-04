import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:lofaz/app/controllers/app_store.dart';
import 'package:lofaz/app/utils/gen/assets.gen.dart';
import 'package:nb_utils/nb_utils.dart';
// import 'package:prokit_flutter/integrations/utils/common.dart';
// import 'package:prokit_flutter/main.dart';
// import 'package:prokit_flutter/main/model/ListModels.dart';
// import 'package:prokit_flutter/main/screens/ProKitLauncher.dart';

import 'AppConstant.dart';
// import 'clusteringGoogleMaps/lat_lang_geohash.dart';

Widget text(
  String? text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor ?? Get.find<AppStore>().textSecondaryColor.value,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? Get.find<AppStore>().scaffoldBackground.value,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

// Future<List<LatLngAndGeohash>> getListOfLatLngAndGeoHash(
//     BuildContext context) async {
//   try {
//     final fakeList = await (loadDataFromJson(context));
//     List<LatLngAndGeohash> myPoints = [];
//     for (int i = 0; i < fakeList!.length; i++) {
//       //TODO Without NullSafety Geo coder
//       //final fakePoint = fakeList[i];
//       final p = LatLngAndGeohash(
//           //TODO Without NullSafety Geo coder
//           // LatLng(fakePoint["LATITUDE"], fakePoint["LONGITUDE"]),
//           );
//       myPoints.add(p);
//     }
//     return myPoints;
//   } catch (e) {
//     throw Exception(e.toString());
//   }
// }

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

Widget commonCacheImageWidget(String? url, double height,
    {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder:
            placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!,
          height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!,
        height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}

Widget settingItem(context, String text,
    {Function? onTap,
    Widget? detail,
    Widget? leading,
    Color? textColor,
    int? textSize,
    double? padding}) {
  return InkWell(
    onTap: onTap as void Function()?,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  child: leading ?? const SizedBox(),
                  width: 30,
                  alignment: Alignment.center),
              leading != null ? 10.width : const SizedBox(),
              Text(text,
                      style: primaryTextStyle(
                          size: textSize ?? 18,
                          color: textColor ??
                              Get.find<AppStore>().textPrimaryColor.value))
                  .expand(),
            ],
          ).expand(),
          detail ??
              Icon(Icons.arrow_forward_ios,
                  size: 16,
                  color: Get.find<AppStore>().textSecondaryColor.value),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

Widget appBarTitleWidget(context, String title,
    {Color? color, Color? textColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: color ?? Get.find<AppStore>().appBarColor.value,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: boldTextStyle(
              color: color ?? Get.find<AppStore>().textPrimaryColor.value,
              size: 20),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}

// AppBar appBar(BuildContext context, String title,
//     {final bool isDashboard = false,
//     List<Widget>? actions,
//     bool showBack = true,
//     Color? color,
//     Color? iconColor,
//     Color? textColor,
//     double? elevation}) {
//   return AppBar(
//     automaticallyImplyLeading: false,
//     backgroundColor: color ?? appStore.appBarColor,
//     leading: showBack
//         ? IconButton(
//             onPressed: () {
//               if (isDashboard) {
//                 ProKitLauncher().launch(context,
//                     isNewTask: true,
//                     pageRouteAnimation: PageRouteAnimation.Fade);
//               } else {
//                 finish(context);
//               }
//             },
//             icon: Icon(Icons.arrow_back,
//                 color: appStore.isDarkModeOn ? white : black),
//           )
//         : null,
//     title:
//         appBarTitleWidget(context, title, textColor: textColor, color: color),
//     actions: actions,
//     elevation: elevation ?? 0.5,
//   );
// }

// class ExampleItemWidget extends StatelessWidget {
//   final ListModel tabBarType;
//   final Function onTap;
//   final bool showTrailing;

//   ExampleItemWidget(this.tabBarType,
//       {required this.onTap, this.showTrailing = false});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: appStore.appBarColor,
//       margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
//       elevation: 2.0,
//       shadowColor: Colors.black,
//       child: ListTile(
//         onTap: () => onTap(),
//         title: Text(tabBarType.name!, style: boldTextStyle()),
//         trailing: showTrailing
//             ? Icon(Icons.arrow_forward_ios,
//                 size: 15, color: appStore.textPrimaryColor)
//             : tabBarType.isNew.validate()
//                 ? Text('New', style: secondaryTextStyle(color: Colors.red))
//                 : null,
//       ),
//     );
//   }
// }

String convertDate(date) {
  try {
    return date != null
        ? DateFormat(dateFormat).format(DateTime.parse(date))
        : '';
  } catch (e) {
    print(e);
    return '';
  }
}

class CustomTheme extends StatelessWidget {
  final Widget? child;

  CustomTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Get.isDarkMode
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: context.scaffoldBackgroundColor,
            )
          : ThemeData.light(),
      child: child!,
    );
  }
}

Widget? Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() =>
    Image.asset(Assets.images.placeholder.path, fit: BoxFit.cover);

BoxConstraints dynamicBoxConstraints({double? maxWidth}) {
  return BoxConstraints(maxWidth: maxWidth ?? applicationMaxWidth);
}

double dynamicWidth(BuildContext context) {
  return isMobile ? Get.width : applicationMaxWidth;
}

/*class ContainerX extends StatelessWidget {
  static String tag = '/ContainerX';
  final BuildContext context;
  final double maxWidth;
  final Widget child;

  ContainerX({@required this.context, this.maxWidth, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      child: ConstrainedBox(
        constraints: dynamicBoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
      alignment: Alignment.topCenter,
    );
  }
}*/

// String parseHtmlString(String? htmlString) {
//   return parse(parse(htmlString).body!.text).documentElement!.text;
// }

class ContainerX extends StatelessWidget {
  final Widget? mobile;
  final Widget? web;
  final bool? useFullWidth;

  const ContainerX({super.key, this.mobile, this.web, this.useFullWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.device == DeviceSize.mobile) {
          return mobile ?? const SizedBox();
        } else {
          return Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: useFullWidth.validate()
                  ? null
                  : dynamicBoxConstraints(maxWidth: Get.width * 0.9),
              child: web ?? const SizedBox(),
            ),
          );
        }
      },
    );
  }
}
