// ignore_for_file: unused_local_variable

import 'package:realm/realm.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:wingmanbd/app/util/app_constants.dart';

import '../data/data_keys.dart';
import '../data/models/schema.dart';
import 'auth_service.dart';

class DbService extends GetxService {
  static const String profileSubName = 'profiles';
  static const String areaDataSubName = 'areaData';
  static const String donationSubName = 'donations';
  static const String reviewSubName = 'reviews';
  static const String feedbackSubName = 'feedbacks';

  final _authService = Get.find<AuthService>();
  GetStorage box = GetStorage();
  Realm? realm;

  final profile = Rxn<Profile>();

  @override
  void onInit() {
    super.onInit();
    initDb(_authService.currentUser.value);
    bindListeners();
  }

  void bindListeners() {
    _authService.currentUser.listen((user) {
      initDb(user);
    });
    profile.listen((profile) {
      if (profile != null && profile.name.isNotEmpty) {
        box.write(kKeyUserName, profile.name);
      }
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
          Feedback.schema,
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

      final feedbackQuery = realm!.all<Feedback>();
      final feedbackSub = realm?.subscriptions.findByName(feedbackSubName);

      realm?.subscriptions.update((mutableSubscriptions) {
        // server-side rules ensure user only downloads their own info
        if (profileSub == null) {
          mutableSubscriptions.add(profileQuery,
              name: profileSubName, update: true);
        }
        if (areaDataSub == null) {
          mutableSubscriptions.add(areaDataQuery,
              name: areaDataSubName, update: true);
        }
        if (donationSub == null) {
          mutableSubscriptions.add(donationQuery,
              name: donationSubName, update: true);
        }
        if (reviewSub == null) {
          mutableSubscriptions.add(reviewQuery,
              name: reviewSubName, update: true);
        }
        if (feedbackSub == null) {
          mutableSubscriptions.add(feedbackQuery,
              name: feedbackSubName, update: true);
        }
      });
      await realm?.subscriptions.waitForSynchronization();
      bindUser(user);
    } else {
      close();
    }
  }

  Future<void> close() async {
    box.remove(kKeyUserName);
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

  void bindUser(User? user) async {
    if (user != null && realm != null) {
      // await user.refreshCustomData().then(
      //     (value) => printInfo(info: "bindUser => User custom data: $value")); //TODO: use this in fututre when supports updating user custom data directly
      // User is logged in & realm exist...
      var query = r'userId == $0';
      var userProfile = realm!.query<Profile>(query, [user.id]);
      if (userProfile.isNotEmpty) {
        profile.value = userProfile.first;
        profile.refresh();
        syncProfileData();
      } else {
        realm?.writeAsync(() => realm?.add(Profile(
              ObjectId(),
              kOrgId,
              _authService.currentUser.value?.id ?? '',
              DateTime.now(),
              lastDonatedAt: DateTime.now(),
            )));
        printError(
            info:
                "bindUser [X]=> user not found in db. Creating a new profile ->");
      }
    }
  }

  void syncProfileData() {
    Map<String, dynamic>? profilePendingData = box.read(kKeyUserPendingProfile);
    printInfo(
        info:
            "DbService >> syncProfileData > profilePendingData: $profilePendingData");
    if (profile.value != null && profilePendingData != null) {
      realm?.writeAsync(() {
        profile.value?.orgId = kOrgId;
        profile.value?.name = profilePendingData[kKeyUserName] ?? "";
        profile.value?.mobile = profilePendingData[kKeyUserMobile] ?? "";
        profile.value?.email = profilePendingData[kKeyUserEmail] ?? "";
        profile.value?.bloodGroup =
            profilePendingData[kKeyUserBloodGroup] ?? "";
      }).then((value) => box.remove(kKeyUserPendingProfile));
    }
  }
}
