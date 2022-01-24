import 'package:get/get.dart';
import 'package:udemy_shop_app/models/product_models.dart';
import 'package:udemy_shop_app/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;

  var isCatgeoryLoading = false.obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://www.pc-help.lt/wp-content/uploads/2016/04/banner-1.jpg",
    "http://www.kantilalchhotalal.com/wp-content/uploads/2016/10/signature_banners1.png",
    "https://image.freepik.com/free-vector/online-shopping-mockup-landing-page-men-s-clothing-internet-store-advertising-banner-layout_76597-131.jpg",
    "https://previews.123rf.com/images/irishasel/irishasel1806/irishasel180600109/103175700-banner-summer-holiday-background-flat-lay-women-s-accessories-set-of-clothes-women-s-blouse-sunglass.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCatgeoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCatgeoryLoading(false);
    }
  }

  getAllCategorys(String namecategory) async {
    isAllCategory(true);
    categoryList.value =
        await AllCategorySercvises.getAllCatehory(namecategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
