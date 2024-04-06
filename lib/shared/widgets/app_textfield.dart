// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:my_formfield/my_formfield.dart';

// import 'package:ecotrack/src/utils/utils.dart';

// class AppTextField extends StatelessWidget {
//   const AppTextField({
//     Key? key,
//     this.inputHint,
//     this.label,
//   }) : super(key: key);
//   final String? label, inputHint;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label ?? 'Form Label',
//           style: AppTextStyle.b1Bold,
//         ),
//         AppSizing.h08,
//         MyFormField(
//           inputFilled: true,
//           inputFillColor: AppColor.black4,
//           border: InputBorder.none,
//           inputHint: inputHint,
//         ),
//         AppSizing.h16
//       ],
//     );
//   }
// }
