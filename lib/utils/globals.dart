import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:reservation_demo/models/api_response.dart';
import 'package:reservation_demo/screens/shared_widgets/text_widget.dart';
import 'package:reservation_demo/utils/themes.dart';

GetStorage localStore = GetStorage();

bool _isLoading = false;

bool get loading => _isLoading;

set loading(bool setLoading) {
  // To prevent multiple show/dismiss dialog
  if (setLoading == !_isLoading) {
    if (setLoading) {
      showLoadingIndicator();
    } else {
      Get.context != null ? Navigator.pop(Get.context!) : {};
    }
    _isLoading = setLoading;
  }
}

showLoadingIndicator() {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 0.0,
        backgroundColor: myTheme.colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            children: [
              16.width,
              CircularProgressIndicator(
                backgroundColor: const Color(0xffD6D6D6),
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(MyThemes().primaryButtonColor),
              ),
              16.width,
              const TextWidget(
                text: "${"Please Wait"}....",
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

showResponseMsgSnackBar(APIResponse response) {
  if (response.errorMessage != null) {
    Get.snackbar("Oops!".tr, response.errorMessage!);
  }
}

/// show Bottom Sheet
showCustomBottomSheet({required Widget Function(ScrollController) builder, required double initialChildSize}) {
  Get.bottomSheet(
    DraggableScrollableSheet(
      initialChildSize: initialChildSize, // half screen on load
      //maxChildSize: 1.0, // full screen on scroll
      //minChildSize: 0.2,
      controller: DraggableScrollableController(),
      expand: false,
      builder: (context, scrollController) {
        return builder(scrollController);
      },
    ),
    backgroundColor: MyThemes().blackWhiteBackgroundColor,
    barrierColor: isDarkMode ? Colors.white38 : Colors.black45,
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}
