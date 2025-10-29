import 'package:e_commercee/data/repositories/repository.dart';
import 'package:e_commercee/shop/models/category_model.dart';
import 'package:e_commercee/shop/models/product_model.dart';
import 'package:e_commercee/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = true.obs; // Added loading flag, default to true
  final _repository = Get.put(Repository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<ProductModel> popularProducts = <ProductModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    fetchPopularProducts();
    super.onInit();
  }


  void fetchPopularProducts() async {
    try {
      isLoading.value = true;
      final products = await _repository.getPopularProducts();
      popularProducts.assignAll(products);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  ///load category data
  Future<void> fetchCategories() async {
    try {
      //show loader
      isLoading(true);

      //fetch categories
      final categories = await _repository.getAllCategories();

      //update the categories list
      allCategories.assignAll(categories);

      //filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
          title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove loader
      isLoading(false);
    }
  }

//load selected category data

//get category or sub category data
}
