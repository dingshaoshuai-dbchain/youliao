import 'package:fluro/fluro.dart';
import 'package:youliao/util/navigator_util.dart';

import '../../page/expert/expert_router.dart';
import '../../page/home/home_router.dart';
import '../../page/match/match_router.dart';
import '../../page/my/my_router.dart';
import '../../page/predict/Predict_router.dart';
import '../../page/router_provider.dart';
import '../app_mode_init_provider.dart';

class RouteInit extends AppModeInitProvider {
  @override
  init() {
    FluroRouter router = FluroRouter();
    List<IRouterProvider> routerList = [];
    routerList.add(HomeRouter());
    routerList.add(ExpertRouter());
    routerList.add(PredictRouter());
    routerList.add(MatchRouter());
    routerList.add(MyRouter());
    for (var element in routerList) {
      element.initRouter(router);
    }
    NavigatorUtil.init(
      router,
      'login/path',
      (pathWrapper, loginPath) {
        if(pathWrapper.path == '1'){
          pathWrapper.path = loginPath;
        }
      },
    );
  }
}
