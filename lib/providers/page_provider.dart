import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

//import 'dart:html' as html; -> this only works in web not in mobile
// i use universal_html pkg for all devices

class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();

  List<String> _pages = ['home', 'about', 'contact', 'pricing', 'location'];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    this.scrollController =
        new PageController(initialPage: getPageIndex(routeName));

    html.document.title = _pages[getPageIndex(routeName)];
    this.scrollController.addListener(() {
      final pageIndex = (this.scrollController.page ?? 0).round();
      if (pageIndex != _currentIndex) {
        html.window.history.pushState(null, '', '#/${_pages[pageIndex]}');
        html.document.title = _pages[pageIndex];
        _currentIndex = pageIndex;
      }
    });
  }

  int getPageIndex(String routeName) {
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    //final routeName = _pages[index];
    //html.window.history.pushState(null, '', '#/${_pages[index]}');
    scrollController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOutSine);
  }
}
