import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/search_view/controller/search_controller.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';


class SearchScreen extends BaseView<SearchViewController>{
  const SearchScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor:
            Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
            title: Image.asset(
              'assets/images/manpower_name_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height*0.075,
              color: LightThemeColors.primaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    prefixIcon: Icon(Icons.search_outlined),
                    focusedBorder: OutlineInputBorder(
                       borderRadius:BorderRadius.all(Radius.circular(10)),
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
                  onChanged: (query){

                  },
                ),
              ) ,
            ),
          )
        ],
      ),
    );
  }

}

