import 'package:get/get.dart';
import 'package:hive_academy/controllers/profile/profile_repository.dart';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';

class ProfileController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();
  List userProfile = [].obs;
  RxBool isLoading = false.obs;

  ProfileController() {
    loadUserProfileFromRepo();
  }

  loadUserProfileFromRepo() async {
    isLoading.value = true;
    try {
      userProfile = await profileRepository.loadUserProfileFromApi();
      isLoading.value = false;
      update();
      storageBox.write('userProfile', userProfile);
      print(userProfile);
    } catch (e) {
      isLoading.value = false;
      return 'Something went wrong';
    }
  }
}
