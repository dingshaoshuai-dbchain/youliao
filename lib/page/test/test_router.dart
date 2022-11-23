import 'package:fluro/fluro.dart';
import 'package:youliao/page/test/page/test_json_page.dart';
import 'package:youliao/page/test/page/test_nested_scroll_page.dart';
import 'package:youliao/page/test/page/test_sliver_pager.dart';
import 'package:youliao/page/test/test_index_page.dart';

import '../router_provider.dart';

class TestRouter implements IRouterProvider {
  static const String _pageRoot = "/test/page";
  static const String indexPage = "$_pageRoot/index_page";
  static const String testSliverPage = "$_pageRoot/test_sliver";
  static const String testNestedScrollerPage =
      "$_pageRoot/test_nested_scroller";
  static const String testJsonPage = "$_pageRoot/test_json_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const TestIndexPage()));
    router.define(testSliverPage,
        handler: Handler(handlerFunc: (_, __) => const TestSliverPage()));
    router.define(testNestedScrollerPage,
        handler: Handler(handlerFunc: (_, __) => const TestNestedScrollPage()));
    router.define(testJsonPage,
        handler: Handler(handlerFunc: (_, __) => const TestJsonPage()));
  }
}
