import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets/app_bar_common.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/basis/text_compose_widget.dart';
import 'package:youliao/widgets/basis/text_widget.dart';
import 'package:youliao/widgets/gaps.dart';
import 'package:youliao/widgets/status_bar.dart';

class ExpertIndexPage extends StatefulWidget {
  const ExpertIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExpertIndexPageState();
}

class _ExpertIndexPageState extends State<ExpertIndexPage> {
  @override
  Widget build(BuildContext context) {
    print("build - ExpertIndexPage");
    return Container(
      child: Stack(
        children: [
          ImageWidget(
            url: 'expert/bg_top',
            width: 1.sw,
            height: 280.h,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const StatusBar(),
              AppBarCommon(
                title: '专家',
                titleColor: Colors.white,
                titleFontSize: 18.sp,
                isShowBack: false,
              ),
              _RecommendExpertWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

/// 顶部推荐专家
class _RecommendExpertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      child: Column(
        children: [
          Row(
            children: [
              TextComposeWidget(
                text: '推荐专家',
                textColor: Colors.white,
                fontSize: 16.sp,
                marginLeft: 20.w,
                fontWeight: FontWeight.w600,
                leftWidget: ImageWidget(
                  url: 'expert/ic_recommend_expert',
                  width: 14.w,
                  height: 14.w,
                  marginRight: 4.5.w,
                ),
              ),
              const Spacer(),
              TextWidget(
                text: '更多专家 >',
                textColor: AppColors.color_999999,
                fontSize: 10.sp,
                paddingHorizontal: 14.w,
                paddingVertical: 5.w,
                onPressed: () {
                  Toast.show('更多专家');
                },
              ),
            ],
          ),
          Gaps.vGapValue(15),
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(context, index, 20);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Gaps.hGap10;
              },
            ),
          ),
          Gaps.vGapValue(13),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index, int count) {
    double? marginLeft = index == 0 ? 12.5.w : null;
    double? marginRight = index == count - 1 ? 12.5.w : null;
    return ContainerWidget(
      width: 97.w,
      backgroundColor: Colors.white,
      radius: 8.w,
      marginLeft: marginLeft,
      marginRight: marginRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ImageWidget(
                url: 'app/ic_default_avatar',
                width: 57.w,
                height: 57.w,
                marginBottom: 8.w,
                onPressed: (){
                  Toast.show('点击了专家');
                },
              ),
              Positioned(
                bottom: 2.w,
                left: 8.w,
                right: 8.w,
                child: TextWidget(
                  text: '资深专家',
                  textColor: Colors.white,
                  fontSize: 8.sp,
                  width: 42.w,
                  paddingVertical: 1.w,
                  radius: 2.w,
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.w,
                      strokeAlign: StrokeAlign.outside),
                  backgroundColor: AppColors.main,
                ),
              )
            ],
          ),
          TextWidget(
            text: '哥只是个传说',
            textColor: AppColors.color_181818,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            marginHorizontal: 2.w,
            marginTop: 2.w,
          ),
          TextWidget(
            text: '平台人气王',
            textColor: AppColors.color_999999,
            fontSize: 8.sp,
            marginTop: 5.w,
          ),
          ImageWidget(
            url: 'expert/ic_expert_attention',
            width: 35.w,
            height: 20.w,
            marginTop: 6.w,
            onPressed: (){
              Toast.show('关注专家');
            },
          ),
        ],
      ),
    );
  }
}