// class HkFullScreenLoader{
//
//   static void openLoadingDialog(String text, String animation){
//     class UFullScreenLoader {
//     static void openLoadingDialog(String text) {
//     showDialog(
//
//     context: Get.overlayContext!,
//     barrierDismissible: false,
//     builder: (_) => PopScope(
//     canPop: false,
//     canPop: false,
//     child: Container(
//     color: HkHelperFunctions.isDarkMode(Get.context!) ? HkColors.dark : HkColors.white,
//     color: UHelperFunctions.isDarkMode(Get.context!) ? UColors.dark : UColors.white,
//     width: double.infinity,
//     height: double.infinity,
//     child: Column(
//     children: [
//     const SizedBox(height: 250,),
//     /// Extra Space
//     const SizedBox(height: 250),
//
//     HkAnimationLoader(text: text, animation: animation)
//     /// Animation
//     UAnimationLoader(text: text)
//     ],
//     ),
//     )
//     )
//     );
//     )));
//     }
//
//     static stopLoading(){
//
//     static stopLoading() {
//     Navigator.of(Get.overlayContext!).pop();
//     }
//     }
//     }