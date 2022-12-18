// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
//
// class privacyScreen extends StatelessWidget {
//  privacyScreen({Key? key}) : super(key: key);
//   PdfViewerController? _pdfViewerController;
//   RxBool _loaded = false.obs;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolor.backgroundcolor.shade100,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 30.0,right: 30,top:30.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: SfPdfViewer.network(
//                 'https://firebasestorage.googleapis.com/v0/b/tour-app-37510.appspot.com/o/privacy-policy%2Fprivacy%2FUntitled%20document%20(1).pdf?alt=media&token=2c948473-579b-40bd-8136-db29f938659f',
//
//               onDocumentLoaded: (PdfDocumentLoadedDetails details) {
//                 _loaded.value = true;
//               },
//               )
//             ),
//             SizedBox(height: 10,),
//             Container(
//               color:Colors.lightBlueAccent,
//                 width: 325.w,
//                 height: 42.h,
//
//                 child: coustombuttom('Agree', ()=>Get.toNamed(home)),),
//             SizedBox(height: 10,),
//             // ElevatedButton(onPressed: (){}, child: Text('Agree'))
//           ],
//         ),
//       ),
//     );
//   }
// }
