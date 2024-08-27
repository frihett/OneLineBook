import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/ui_style/ui_style.dart';

class LicensePage extends StatelessWidget {
  const LicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라이센스', style: UiStyle.h2Style),
        backgroundColor: UiStyle.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Text(
            '이 애플리케이션은 다음과 같은 오픈 소스 라이브러리를 사용하고 있습니다:\n\n'
                '1. Flutter\n'
                '2. Cupertino Icons\n'
                '3. Freezed\n'
                '4. Json Serializable\n'
                '5. Http\n'
                '6. Kakao Flutter SDK\n'
                '7. Firebase\n'
                '8. Provider\n'
                '9. Go Router\n'
                '10. Cloud Firestore\n'
                '11. Intl\n'
                '12. Flutter Screenutil\n'
                '13. Flutter Dotenv\n'
                '14. Carousel Slider\n\n'
                '각 라이브러리의 라이센스는 해당 라이브러리의 문서에서 확인할 수 있습니다.',
            style: UiStyle.bodyStyle,
          ),
        ),
      ),
    );
  }
}