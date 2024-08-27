import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/ui_style/ui_style.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이용약관', style: UiStyle.h2Style),
        backgroundColor: UiStyle.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '이용약관',
                style: UiStyle.h1Style,
              ),
              SizedBox(height: 16.h),
              Text(
                '1. 소개\n\n'
                    '본 이용약관(이하 "약관")은 OneLineReviewer (이하 "서비스")를 이용하는 데 관한 규칙과 조건을 설명합니다. 서비스를 사용함으로써, 귀하는 본 약관에 동의하는 것으로 간주됩니다.\n\n'
                    '2. 서비스\n\n'
                    'OneLineReviewer는 사용자가 책을 선택하고, 독후감을 작성할 수 있는 플랫폼을 제공합니다.\n\n'
                    '3. 사용자 계정\n\n'
                    '사용자는 서비스를 이용하기 위해 계정을 생성해야 합니다. 사용자는 자신의 계정 정보가 정확하고 최신 상태를 유지할 책임이 있습니다.\n\n'
                    '4. 사용자 의무\n\n'
                    '- 사용자는 서비스 이용 시, 모든 법률 및 규정을 준수해야 합니다.\n'
                    '- 불법적인 활동을 하거나 타인의 권리를 침해하는 행위를 해서는 안 됩니다.\n\n'
                    '5. 서비스의 변경 및 종료\n\n'
                    '저희는 서비스의 전부 또는 일부를 언제든지 변경하거나 종료할 수 있습니다.\n\n'
                    '6. 책임의 한계\n\n'
                    '서비스는 "있는 그대로" 제공되며, 저희는 서비스의 정확성, 완전성, 신뢰성에 대해 보증하지 않습니다. 서비스 이용으로 인한 손해에 대해서는 책임을 지지 않습니다.\n\n'
                    '7. 이용약관의 변경\n\n'
                    '저희는 필요에 따라 본 약관을 수정할 수 있습니다. 변경 사항은 서비스 내 공지 또는 이메일을 통해 사용자에게 알려드립니다.\n\n'
                    '8. 분쟁 해결\n\n'
                    '본 약관에 관한 모든 분쟁은 대한민국 서울특별시에 위치한 서울중앙지방법원의 관할에 따릅니다.\n\n'
                    '9. 연락처\n\n'
                    '서비스에 대한 문의는 [ssgodda@naver.com](mailto:ssgodda@naver.com) 로 보내주시기 바랍니다.',
                style: UiStyle.bodyStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}