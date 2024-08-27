import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/ui_style/ui_style.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('개인정보 처리방침', style: UiStyle.h2Style),
        backgroundColor: UiStyle.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '개인정보 처리방침',
                style: UiStyle.h1Style,
              ),
              SizedBox(height: 16.h),
              Text(
                '1. 개인정보 수집\n\n'
                    '저희는 사용자가 다음과 같은 개인정보를 수집할 수 있습니다:\n\n'
                    '- 이름\n'
                    '- 이메일 주소\n'
                    '- 프로필 사진\n'
                    '- 작성한 리뷰와 관련된 정보\n\n'
                    '2. 개인정보 사용\n\n'
                    '수집된 개인정보는 다음과 같은 목적으로 사용됩니다:\n\n'
                    '- 사용자 계정 생성 및 관리\n'
                    '- 리뷰 작성 및 관리\n'
                    '- 서비스 개선 및 고객 지원\n'
                    '- 마케팅 및 프로모션 (사용자가 동의한 경우에 한함)\n\n'
                    '3. 개인정보 공유\n\n'
                    '저희는 사용자의 개인정보를 다음과 같은 경우에 제3자와 공유할 수 있습니다:\n\n'
                    '- 법적 요구가 있는 경우\n'
                    '- 서비스 제공을 위해 필요한 제3자 (예: 결제 처리 업체)\n\n'
                    '4. 개인정보 보호\n\n'
                    '저희는 사용자 개인정보를 보호하기 위해 합리적인 보안 조치를 취합니다. 그러나 데이터 전송 및 저장의 완벽한 보안을 보장할 수는 없습니다.\n\n'
                    '5. 사용자의 권리\n\n'
                    '사용자는 자신의 개인정보에 대한 접근, 수정, 삭제 요청을 할 수 있습니다. 이러한 요청은 [이메일 주소]로 보내주시면 처리하겠습니다.\n\n'
                    '6. 쿠키 사용\n\n'
                    '저희는 쿠키를 사용하여 사용자 경험을 향상시키고 분석을 수행합니다. 사용자는 브라우저 설정을 통해 쿠키 사용을 거부할 수 있습니다.\n\n'
                    '7. 개인정보 처리방침의 변경\n\n'
                    '저희는 필요에 따라 개인정보 처리방침을 수정할 수 있습니다. 변경 사항은 서비스 내 공지 또는 이메일을 통해 사용자에게 알려드립니다.\n\n'
                    '8. 연락처\n\n'
                    '개인정보 처리에 대한 문의는 [ssgodda@naver.com](mailto:ssgodda@naver.com) 로 보내주시기 바랍니다.',
                style: UiStyle.bodyStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}