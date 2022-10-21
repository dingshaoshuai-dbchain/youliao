import 'package:flutter/material.dart';
import 'package:youliao/app_res/app_colors.dart';
import 'package:youliao/app_widgets/sign/sign_item.dart';
import 'package:youliao/app_widgets/sign/task_item.dart';
import 'package:youliao/widgets/basis/round_container.dart';
import 'package:youliao/widgets/basis/round_image.dart';
import 'package:youliao/widgets/image_back.dart';
import 'package:youliao/widgets/status_bar.dart';

import '../../../../widgets/basis/round_text.dart';

class TaskCenterPage extends StatefulWidget {
  const TaskCenterPage({super.key});

  @override
  State<StatefulWidget> createState() => _TaskCenterPageState();
}

class _TaskCenterPageState extends State<TaskCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RoundImage(url: 'my/task/bg_task_center'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusBar(),
              const ImageBack(isBlack: false),
              _buildUserInfo(),
              _buildContent(
                title: '连续签到送好礼',
                marginTop: 30,
                child: _buildSign(context),
              ),
              _buildContent(
                title: '做任务赚金币',
                marginTop: 12,
                child: _buildTask(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildUserInfo() {
  return RoundContainer(
    width: double.maxFinite,
    height: 52,
    marginLeft: 16,
    marginRight: 16,
    marginTop: 25,
    child: Row(
      children: [
        const RoundImage(
          url: 'app/ic_gold',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text.rich(
                  TextSpan(
                    text: '已连续签到',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: ' 1 ',
                        style: TextStyle(
                          color: AppColors.main,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '天',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                RoundText(
                  alignment: Alignment.centerLeft,
                  text: '明日签到可获得10金币',
                  textColor: Color(0xFF7E8398),
                  fontSize: 12,
                  marginTop: 3,
                ),
              ],
            ),
          ),
        ),
        RoundContainer(
          width: 82,
          height: 41,
          borderSide: const BorderSide(color: Color(0xFF7E8398), width: 1),
          radius: 12,
          child: Row(
            children: const [
              RoundImage(
                url: 'app/ic_gold',
                width: 24,
                height: 24,
                marginLeft: 10,
              ),
              Expanded(
                child: RoundText(
                  text: '100',
                  alignment: Alignment.centerLeft,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  paddingLeft: 5,
                  paddingRight: 2,
                  textColor: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildSign(BuildContext context) {
  return RoundContainer(
    alignment: Alignment.center,
    height: 180,
    marginTop: 15,
    child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
          itemCount: 7,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 13,
            crossAxisSpacing: 13,
            mainAxisExtent: 80,
          ),
          itemBuilder: (context, index) {
            return SignItemWidget();
          },
        )),
  );
}

Widget _buildTask(BuildContext context) {
  return RoundContainer(
    alignment: Alignment.center,
    height: 180,
    marginTop: 15,
    child: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TaskItemWidget();
        },
      ),
    ),
  );
}

Widget _buildContent({
  required String title,
  required double marginTop,
  required Widget child,
}) {
  return RoundContainer(
    marginLeft: 16,
    marginRight: 16,
    marginTop: marginTop,
    backgroundColor: Colors.white,
    radius: 12,
    paddingLeft: 15,
    paddingRight: 15,
    paddingTop: 16,
    paddingBottom: 13,
    child: Column(
      children: [
        RoundText(
          text: title,
          textColor: AppColors.color_181818,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          alignment: Alignment.centerLeft,
        ),
        child
      ],
    ),
  );
}
