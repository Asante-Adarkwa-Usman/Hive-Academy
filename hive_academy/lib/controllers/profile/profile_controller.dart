import 'package:get/get.dart';
import 'package:hive_academy/controllers/profile/profile_repository.dart';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';

class ProfileController extends GetxController {
  final ProfileRepository profileRepository = ProfileRepository();

  final RxBool isLoading = false.obs;
  final RxBool isSuccessful = false.obs;

  loadUserProfileFromRepo(String email, String password) async {
    isLoading.value = true;
    try {
      var userDetail =
          await profileRepository.loadUserProfileFromApi(email, password);
      if (userDetail != null) {
        isLoading.value = false;
        isSuccessful.value = true;
      }
      update();

      print(userDetail);
      storageBox.write('userDetailsKey', userDetail);

      return isSuccessful.value;
    } catch (e) {
      return isSuccessful.value;
    }
  }
}
