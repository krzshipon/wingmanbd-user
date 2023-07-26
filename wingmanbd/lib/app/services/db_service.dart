// ignore_for_file: unused_local_variable

import 'package:realm/realm.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../data/data_keys.dart';
import '../data/models/schema.dart';
import 'auth_service.dart';

class DbService extends GetxService {
  static const String profileSubName = 'profiles';
  static const String areaDataSubName = 'areaData';
  static const String donationSubName = 'donations';
  static const String reviewSubName = 'reviews';

  final _authService = Get.find<AuthService>();
  GetStorage box = GetStorage();
  Realm? realm;

  final profile = Rxn<Profile>();

  @override
  void onInit() {
    super.onInit();
    initDb(_authService.currentUser.value);
    _authService.currentUser.listen((user) {
      initDb(user);
    });
  }

  Future<void> initDb(User? user) async {
    if (user != null) {
      final conf = Configuration.flexibleSync(
        user,
        [
          Profile.schema,
          AreaData.schema,
          Donation.schema,
          Review.schema,
          //Embedded
          Location.schema,
          Address.schema,
          UserInfo.schema,
          BasicUser.schema,
          Division.schema,
          City.schema,
          Area.schema
        ],
      );
      realm = Realm(conf);
      // Check if the subscription already exists before adding
      final profileQuery = realm!.query<Profile>(r'userId == $0', [user.id]);
      final profileSub = realm?.subscriptions.findByName(profileSubName);

      final areaDataQuery = realm!.all<AreaData>();
      final areaDataSub = realm?.subscriptions.findByName(areaDataSubName);

      final donationQuery = realm!.all<Donation>();
      final donationSub = realm?.subscriptions.findByName(donationSubName);

      final reviewQuery = realm!.all<Review>();
      final reviewSub = realm?.subscriptions.findByName(reviewSubName);

      //if (realm?.subscriptions.isEmpty ?? false) {
      //if (profileSub == null) {
      realm?.subscriptions.update((mutableSubscriptions) {
        mutableSubscriptions.clear();
        // server-side rules ensure user only downloads their own info
        mutableSubscriptions.add(profileQuery,
            name: profileSubName, update: true);
        mutableSubscriptions.add(areaDataQuery,
            name: areaDataSubName, update: true);
        mutableSubscriptions.add(donationQuery,
            name: donationSubName, update: true);
        mutableSubscriptions.add(reviewQuery,
            name: reviewSubName, update: true);
      });
      await realm?.subscriptions.waitForSynchronization();
      //}
      //}
      bindProfile(user);
    } else {
      close();
    }
  }

  Future<void> close() async {
    box.remove(kUserName);
    if (_authService.currentUser.value != null) {
      await _authService.currentUser.value?.logOut();
      _authService.currentUser.value = null;
    }
    profile.value = null;
    realm?.close();
  }

  @override
  void onClose() {
    realm?.close();
    super.onClose();
  }

  void bindProfile(User? user) {
    if (user != null && realm != null) {
      // User is logged in & realm exist...
      var query = r'userId == $0';
      var profileStream = realm!
          .all<Profile>()
          .changes
          .map((profileEvent) => profileEvent.results);
      profileStream.listen((results) {
        if (results.isNotEmpty) {
          profile.value = results[0];
          profile.refresh();
          box.write(kUserName, profile.value?.name);
        }
      });
    }
  }
}
