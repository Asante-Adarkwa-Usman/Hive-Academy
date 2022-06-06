import 'package:get/get.dart';
import 'package:hive_academy/controllers/profile/profile_repository.dart';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';

class ProfileController extends GetxController {
  final ProfileRepository profileRepository = ProfileRepository();

  RxBool isLoading = false.obs;
  RxBool isLoginSuccess = false.obs;

  loadUserProfileFromRepo(String email, String password) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> userProfile =
          await profileRepository.loadUserProfileFromApi(email, password);
      isLoading.value = false;
      isLoginSuccess.value = true;
      storageBox.write('userProfile', userProfile);
      update();

      print(isLoginSuccess.value);
      print(userProfile);
    } catch (e) {
      isLoading.value = false;
      isLoginSuccess.value = false;
      return 'Something went wrong';
    }
  }
}
