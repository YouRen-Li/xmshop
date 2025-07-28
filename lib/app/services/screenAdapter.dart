import 'package:flutter_screenutil/flutter_screenutil.dart';

// 对flutter_screenutil进行二次封装

class Screenadapter {
  static width(num v) {
    return v.w;
  }

  static height(num v) {
    return v.h;
  }

  static fontsize(num v) {
    return v.sp;
  }

  static getScreenWidht(num v) {
    return ScreenUtil().screenWidth;
    // return 1.sw;
  }

  static getScreenHeight(num v) {
    return ScreenUtil().screenHeight;
    // return 1.sh
  }
}
