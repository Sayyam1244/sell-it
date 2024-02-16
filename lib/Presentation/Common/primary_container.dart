import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.colors,
    this.shadowOffset,
    this.borderColor,
  });
  final double? height;
  final double? width;
  final Widget child;
  final List<Color>? colors;
  final double? shadowOffset;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 44.h,
      width: width ?? 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? AppColors.blue1.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, shadowOffset ?? 1.h),
              color: AppColors.blackColor.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 3)
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors ??
              [
                AppColors.blue1,
                AppColors.blue2,
              ],
        ),
      ),
      child: child,
    );
  }
}

class PrimaryAnimatedContainer extends StatelessWidget {
  const PrimaryAnimatedContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.colors,
    this.shadowOffset,
    this.borderColor,
  });
  final double? height;
  final double? width;
  final Widget child;
  final List<Color>? colors;
  final double? shadowOffset;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height ?? 44.h,
      width: width ?? 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? AppColors.blue1.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, shadowOffset ?? 1.h),
              color: AppColors.blackColor.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 3)
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors ??
              [
                AppColors.blue1,
                AppColors.blue2,
              ],
        ),
      ),
      duration: const Duration(milliseconds: 200),
      child: child,
    );
  }
}
