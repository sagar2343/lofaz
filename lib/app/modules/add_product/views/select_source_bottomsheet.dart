import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// class SelectImageSourceBottomsheet extends StatelessWidget {
//   const SelectImageSourceBottomsheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         borderRadius: const BorderRadius.all(Radius.circular(12)),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               foregroundColor: Colors.black,
//               centerTitle: true,
//               title: const Text(
//                 "Select Image Source",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               automaticallyImplyLeading: false,
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: const Icon(Icons.close),
//                 ),
//               ],
//             ),
//             ListTile(
//               title: const Text("Camera"),
//               leading: const Icon(Icons.camera_alt),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () {
//                 Get.back(result: ImageSource.camera);
//               },
//             ),
//             ListTile(
//                 title: const Text("Gallery"),
//                 leading: const Icon(Icons.image),
//                 trailing: const Icon(Icons.arrow_forward),
//                 onTap: () {
//                   Get.back(result: ImageSource.gallery);
//                 }),
//             const SizedBox(
//               height: 10,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class SelectImageSourceDialog extends StatelessWidget {
  const SelectImageSourceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            foregroundColor: Colors.black,
            automaticallyImplyLeading: false,
            title: const Text("Image Source"),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Get.back(result: ImageSource.camera);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 50,
                            ),
                            Text("Camera"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                      child: InkWell(
                    onTap: () {
                      Get.back(result: ImageSource.gallery);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            size: 50,
                          ),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
