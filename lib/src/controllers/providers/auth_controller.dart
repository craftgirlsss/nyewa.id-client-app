import 'package:get/get.dart';

class ProviderAuthController extends GetxController{
  RxString providerToken = "".obs;
  RxBool isLoading = false.obs;
  RxBool isProfileCompleted = false.obs;
  RxList listBusinessPhoto = [].obs;
}