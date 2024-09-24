import 'package:flutter/material.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';

class AllCategories extends BaseView<CategoryController> {
  const AllCategories({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: GridView.builder(
        // Adjust the aspect ratio based on your design
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: controller.allCategoryData.length,
        itemBuilder: (context, index) {
          final category = controller.allCategoryData[index];
          return Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Center(
                      child: Image.asset(
                        category.imagePath,
                        height: size.height * 0.1,
                        width: size.width * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      category.name,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    category.description,
                    style:
                        const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
