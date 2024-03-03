import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

showMotionToastError({required BuildContext context,required String subject,required String title }){
  return MotionToast.error(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(subject),
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: true,
  ).show(context);
}

showMotionToastSuccess({required BuildContext context,required String subject,required String title }){
  return MotionToast.success(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(subject),
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: true,
  ).show(context);
}