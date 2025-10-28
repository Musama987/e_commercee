import 'package:e_commercee/data/repositories/categories/category_repository.dart';
import 'package:e_commercee/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  static RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // Load category data
  Future<void> fetchCategories() async {
    try {
      // Fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      print(categories);

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured)
          .take(2)
          .toList());

      final c = featuredCategories;
    } catch (e) {
      Get.snackbar('Oh Snap!', e.toString());
    }
  }
}