import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/features/shop/models/category_model.dart';
import 'package:a_store/features/shop/screens/store/store_screen.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MyDimensions.defultSpacing),
              child:
                  MySectionHeading(title: S.current.brands, showActionButton: false),
            ),
            MyCategoryTab(
              categoryId: category.id!,
            ),
          ],
        ),
      ),
    );
  }
}
