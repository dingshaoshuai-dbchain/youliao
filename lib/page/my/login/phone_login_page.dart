import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/global/length_config.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets/basis/text_widget.dart';
import 'package:youliao/widgets/gaps.dart';
import 'package:youliao/widgets_app/AppButton.dart';

import '../../../widgets_app/SmsCodeButton.dart';
import 'login_text_field_widget.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: 13.w,
                  child: TextWidget(
                      text: '中国 +86',
                      textColor: AppColors.color_181818,
                      alignment: Alignment.topLeft,
                      fontSize: 16.sp),
                ),
                LoginTextFieldWidget(
                  hintText: '请输入手机号码',
                  maxLength: phoneLength,
                  paddingLeft: 75,
                  keyboardType: TextInputType.phone,
                )
              ],
            ),
            Gaps.vGapValue(22.w),
            Stack(
              children: [
                LoginTextFieldWidget(
                  hintText: '请输入验证码',
                  maxLength: smsCodeLength,
                  keyboardType: TextInputType.number,
                ),
                Positioned(
                  bottom: 13.w,
                  right: 0,
                  child: SmsCodeButton(),
                )
              ],
            ),
            Gaps.vGapValue(22.w),
            LoginTextFieldWidget(
              hintText: '请输入邀请码（可不填写）',
              maxLength: inviteCodeLength,
              keyboardType: TextInputType.text,
            ),
            AppButton(
              text: '登录',
              marginTop: 40,
              marginHorizontal: 0,
              onPressed: () => {Toast.show('登录')},
            )
          ],
        ),
      ),
    );
  }
}