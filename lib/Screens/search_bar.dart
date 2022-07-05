import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchBarPage extends StatelessWidget {
  const SearchBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  FloatingSearchBarController controller = FloatingSearchBarController();

    return Scaffold(
      body: FloatingSearchBar(
        hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      //  axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      //width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      controller:controller , 
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (BuildContext context, Animation<double> transition) { 
        return Container();
       },
      ),
    );
  }
}