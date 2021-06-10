import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  // This handler is called two times because is taking / and home like params

  final route = params['page']!.first;
  if (route != '/') {
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);

    pageProvider.createScrollController(route);
    return HomePage();
  }
});
