import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/text_widget.dart';
import 'package:youliao/widgets/image_back.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  AppBarCommon({
    super.key,
    required this.title,
    this.isShowBack = true,
    this.isBlackBack = true,
    // 标题字体样式
    this.titleColor = AppColors.color_181818,
    this.titleFontSize = 18,
    this.titleFontWeight = FontWeight.w600,
    // 标题及状态栏颜色
    this.backgroundColor = Colors.white,
    // 状态栏字体颜色是否为黑色
    this.isBlackStatusFontColor = true,
  });

  final String title;
  final Color titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  final Color backgroundColor;

  /// 是否显示返回按钮
  final bool isShowBack;

  /// 返回按钮是否为黑色的
  final bool isBlackBack;

  /// 系统状态栏颜色是否为黑色
  final bool isBlackStatusFontColor;

  @override
  Widget build(BuildContext context) {
    Widget content = ContainerWidget(
      alignment: Alignment.center,
      width: double.infinity,
      height: 45.h,
      backgroundColor: backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Row(
              children: [
                if (isShowBack)
                  ImageBack(
                    isBlack: isBlackBack,
                  ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: TextWidget(
              text: title ?? '',
              textColor: titleColor,
              fontSize: titleFontSize,
              fontWeight: titleFontWeight,
            ),
          ),
        ],
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isBlackStatusFontColor
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Material(
        color: backgroundColor,
        child: SafeArea(
          child: content,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}
