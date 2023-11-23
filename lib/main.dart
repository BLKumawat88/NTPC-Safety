import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/views/animation%20video/animation_video.dart';
import 'package:ntpc/views/check_list.dart';
import 'package:ntpc/views/dashboard/dashboard.dart';
import 'package:ntpc/views/dashboard/health_screen.dart';
import 'package:ntpc/views/dashboard/rewards&recognition/rewards_and%20_recognition.dart';
import 'package:ntpc/views/dashboard/safety_performance_statics_screen.dart';
import 'package:ntpc/views/dashboard/sub_category_list.dart';
import 'package:ntpc/views/e_SMP_section/List_of_hazard_ControlPlans.dart';
import 'package:ntpc/views/e_SMP_section/add_new_hazard.dart';
import 'package:ntpc/views/e_SMP_section/add_new_workplan_number.dart';
import 'package:ntpc/views/e_SMP_section/esmp_dashboard.dart';
import 'package:ntpc/views/e_SMP_section/esmp_view_list.dart';
import 'package:ntpc/views/e_SMP_section/list_of_hazard_controlpansview_list.dart';
import 'package:ntpc/views/e_SMP_section/my_hazards_data.dart';
import 'package:ntpc/views/e_SMP_section/view_esmp.dart';
import 'package:ntpc/views/eventcalendar/event_calendar.dart';
import 'package:ntpc/views/forms/Cmhq_forms/HEMM_MonitoringSystem.dart';
import 'package:ntpc/views/forms/Cmhq_forms/Hemmsytemfromview.dart';
import 'package:ntpc/views/forms/Cmhq_forms/cmhqone_f.dart';
import 'package:ntpc/views/forms/Cmhq_forms/cmhqupdate.dart';
import 'package:ntpc/views/forms/Cmhq_forms/hemmsystemeditandupdate.dart';
import 'package:ntpc/views/forms/Cmhq_forms/raklodingformsfilstupdate.dart';
import 'package:ntpc/views/forms/Cmhq_forms/raklodingformsfist.dart';
import 'package:ntpc/views/forms/Cmhq_forms/raklodingview.dart';
import 'package:ntpc/views/forms/Cmhq_forms/viewcmhfrom.dart';
import 'package:ntpc/views/forms/daily_check_list.dart';
import 'package:ntpc/views/forms/dozer_maintainace_week.dart';
import 'package:ntpc/views/forms/drill_maintainace_daily.dart';
import 'package:ntpc/views/forms/drill_maintainace_weekly.dart';
import 'package:ntpc/views/forms/excavator_form.dart';
import 'package:ntpc/views/forms/excavator_maintainace_daily.dart';
import 'package:ntpc/views/forms/explosive_daily_check_list.dart';
import 'package:ntpc/views/forms/explosive_van_maintainace_daily.dart';
import 'package:ntpc/views/forms/form.dart';
import 'package:ntpc/views/forms/explosive_weekly_check_list.dart';
import 'package:ntpc/views/forms/mine_shift_end.dart';
import 'package:ntpc/views/forms/shift_report_banadag_siding.dart';
import 'package:ntpc/views/forms/show_mst_grader_maintainace_weekly.dart';
import 'package:ntpc/views/forms/thriveni_forms/Daily%20check%20sheet.dart';
import 'package:ntpc/views/forms/thriveni_forms/Daily_Inspection_Checklist.dart';
import 'package:ntpc/views/forms/thriveni_forms/Excavator%20daily%20checklist.dart';
import 'package:ntpc/views/forms/thriveni_forms/Pre%20Start%20Check%20In%20Every%20Shift%20In%20Line.dart';
import 'package:ntpc/views/forms/thriveni_forms/daily%20pre%20shiftcheck%20sheet.dart';
import 'package:ntpc/views/forms/thriveni_forms/dailyMaintenancechecklist.dart';
import 'package:ntpc/views/forms/thriveni_forms/operator%20safety%20checklist.dart';
import 'package:ntpc/views/forms/thriveni_forms/shovel%20pre%20start%20checklist.dart';
import 'package:ntpc/views/forms/van_maintainace_weekly.dart';
import 'package:ntpc/views/home_screen.dart';
import 'package:ntpc/views/index.dart';
import 'package:ntpc/views/isuser_logged_in/is_user_logged_in.dart';
import 'package:ntpc/views/jailbroken_screen.dart';
import 'package:ntpc/views/library.dart';
import 'package:ntpc/views/location.dart';
import 'package:ntpc/views/notifications/notifications_screen.dart';
import 'package:ntpc/views/ntpc%20mission/ntpc_mission.dart';
import 'package:ntpc/views/ntpc%20safety/safety_list.dart';
import 'package:ntpc/views/quiz/quiz_category_list.dart';
import 'package:ntpc/views/quiz/quiz_screen.dart';
import 'package:ntpc/views/quiz/result_screen.dart';
import 'package:ntpc/views/social%20wall/comment_section.dart';
import 'package:ntpc/views/social%20wall/social_post_list.dart';
import 'package:ntpc/views/social%20wall/user_block_list.dart';
import 'package:ntpc/views/unsafe_act_list.dart';
import 'package:ntpc/views/unsafe_location.dart';
import 'package:ntpc/views/upload.dart';
import 'package:provider/provider.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

import 'Other user profile/other_user_profile.dart';

void main() async {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Plugin must be initialized before using
  // await FlutterDownloader.initialize(
  //     debug:
  //         true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
      ],
      path: "assets/resources",
      saveLocale: true,
      child: MyApp(),
      // fallbackLocale: Locale('en', 'US'),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool? _jailbroken;
  bool? _developerMode;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AllInProvider(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'NTPC Sachetan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => IsUserLoggedInOrNot(),
          // '/': (context) => JailbrokenScreen(),
          '/home_screen': (context) => HomeScreen(),
          '/dashboard_screen': (context) => DashboardScreen(),
          '/sub_category_list': (context) => SubCagegoryList(),
          '/upload_screen': (context) => UploadScreen(),
          '/unsafe_location': (context) => UnsafeLocation(),
          '/unsafe_act_list': (context) => UnsafeActListScreen(),
          '/location_screen': (context) => LocationScreen(),
          '/library_screen': (context) => LibraryScreen(),
          '/index_screen': (context) => IndexScreen(),
          '/form_maintenance': (context) => FormMaintenance(),
          '/Explosive_weekly_check_list': (context) =>
              ExplosiveWeeklyCheckList(),
          '/Explosive_daily_check_list': (context) => ExplosiveDailyCheckList(),
          '/daily_check_list': (context) => DailyCheckList(),
          '/excavator_form': (context) => ExcavatorForm(),
          '/check_list': (context) => CheckList(),
          '/safety_list': (context) => SafetyListScreen(),
          '/dozer_maintainace_week': (context) => DozerMaintainaceWeek(),
          '/drill_maintainace_daily': (context) => DrillMaintainaceDailyForm(),
          '/drill_maintainace_weekly': (context) =>
              DrillMaintainaceWeeklyScreen(),
          '/excavator_maintainace_daily': (context) =>
              ExcavatorMaintainaceDaily(),
          '/explosive_van_maintainace_daily': (context) =>
              ExplosiveVanMaintainaceDaily(),
          '/explosive_van_maintainace_weekly': (context) =>
              ExplosiveVanMaintainaceweekly(),
          '/show_mst_grader_maintainace_weekly': (context) =>
              ShowMstGradernMaintainaceweekly(),
          '/notifications': (context) => NotificationsScreen(),
          '/ntpc_mission': (context) => NTPCMission(),
          '/esmp_dashboard': (context) => ESMPDashboard(),
          '/esmp_list': (context) => ESMPViewList(),

          '/listofhazardcontrolpansview': (context) =>
              Listofhazardcontrolpansview(),
          '/getWorkpanbyid': (context) => Workpanbyid(),

          '/getviewesmpcontrolpans': (context) => viewesmpcontrolpans(),

          //viewesmpcontrolpans

          //add new esmppanalsviewlist

          // '/esmp_list': (context) => ESMPpanalsViewList(),

          '/quiz_screen': (context) => QuizScreen(),
          '/event_calendar': (context) => EventCalendar(),
          '/health': (context) => HealthScreen(),
          '/safety_performance_staticsScreen': (context) =>
              SafetyPerformanceStaticsScreen(),
          '/quiz_category_list': (context) => QuizCategoryLIstScreen(),
          '/social_post_list': (context) => SocialPostListScreen(),
          '/quiz_result_screen': (context) => QuizResultScreen(),
          '/social_comment': (context) => CommentSectionScreen(),
          '/rewards_and_recognition': (context) => RewardsAndRecognition(),
          '/my_hazards_data': (context) => MyHazardsScreen(),
          '/mine_shift_end_report': (context) => MinesShifeEnd(),
          '/get_other_user_profile': (context) => OtherUserProfileScreen(),
          '/shift_report_banadag_siding': (context) =>
              ShiftReportBanadagSiding(),
          '/blocked_list_list': (context) => UserBlockList(),
          '/Cmhq': (context) => Cmhq(),
          '/getCmhqview': (context) => Cmhqview(),
          '/getCmhqupdate': (context) => Cmhqupdate(),
          //Thriveni
          '/Daily Inspection Checklist': (context) =>
              DailyInspectionChecklist(),
          '/prestart checkin Every shift in Line': (context) =>
              prestartcheckinEveryshiftinLine(),
          '/daily checks sheet': (context) => dailychecksheet(),
          '/daily pre shift check sheet': (context) =>
              dailypreshiftchecksheet(),
          '/operator safety check list': (context) => operatorsafetychecklist(),
          '/shovel pre start check list': (context) =>
              shovelprestartchecklist(),
          '/daily maintenace check list': (context) =>
              dailymaintenacechecklist(),
          '/excavator daily check list': (context) => excavatordailychecklist(),
          '/animation_video': (context) => AnimationVideoScreen(),
          '/rakloding': (context) => rakloding(),
          '/getrakeview': (context) => rakevieww(),
          '/getraklodingupdate': (context) => raklodingupdate(),
          '/Hemmsytemfrom': (context) => Hemmsytemfrom(),
          '/getHemmsytemfromview': (context) => Hemmsytemfromview(),
          '/getHemmsystemeditandupdate': (context) => Hemmsystemeditandupdate(),
          "/AddNewWorkPlanNumber": (context) => AddNewWorkPlanNumber(),
          "/add_new_esmp_hazard": (context) => AddNewHazard(),
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
