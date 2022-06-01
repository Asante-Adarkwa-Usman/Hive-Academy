import 'package:get/get.dart';
import 'package:hive_academy/controllers/profile/profile_repository.dart';

import 'package:hive_academy/utils/storage_box/storage_constant.dart';

class ProfileController extends GetxController {
  final ProfileRepository profileRepository = ProfileRepository();
  List userProfile = [].obs;
  RxBool isLoading = false.obs;
  RxBool isLoginSuccess = false.obs;

  ProfileController() {
    loadUserProfileFromRepo();
  }

  loadUserProfileFromRepo() async {
    isLoading.value = true;
    try {
      userProfile = await profileRepository.loadUserProfileFromApi();
      update();
      isLoading.value = false;
      isLoginSuccess.value = true;
      print(userProfile);

      return userProfile;
    } catch (e) {
      update();
      isLoading.value = false;
      isLoginSuccess.value = false;
      return 'Something went wrong';
    }
  }
}
