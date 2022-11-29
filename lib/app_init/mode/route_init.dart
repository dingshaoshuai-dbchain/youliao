import 'package:fluro/fluro.dart';
import 'package:youliao/page/test/test_router.dart';

import '../../dss_library/util/navigator_util.dart';
import '../../page/expert/expert_router.dart';
import '../../page/find/find_router.dart';
import '../../page/match/match_router.dart';
import '../../page/my/my_router.dart';
import '../../page/predict/predict_router.dart';
import '../../page/router_provider.dart';
import '../app_mode_init_provider.dart';

class RouteInit extends AppModeInitProvider {
  @override
  init() {
    FluroRouter router = FluroRouter();
    List<IRouterProvider> routerList = [];
    routerList.add(FindRouter());
    routerList.add(ExpertRouter());
    routerList.add(PredictRouter());
    routerList.add(MatchRouter());
    routerList.add(MyRouter());
    routerList.add(TestRouter());
    for (var element in routerList) {
      element.initRouter(router);
    }
    NavigatorUtil.init(
        router: router,
        loginPagePath: 'login/path',
        checkLoginFunction: () {
          /// TODO 改为真正的判断是否需要登录
          return false;
        });
  }
}
