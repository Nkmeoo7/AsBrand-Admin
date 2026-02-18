import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/data/data_provider.dart';
import '../../../models/category.dart';
import '../../../models/sub_category.dart';
import '../../../utility/constants.dart';

class ProductFilterSection extends StatefulWidget {
  const ProductFilterSection({Key? key}) : super(key: key);

  @override
  State<ProductFilterSection> createState() => _ProductFilterSectionState();
}

class _ProductFilterSectionState extends State<ProductFilterSection> {
  Category? selectedCategory;
  SubCategory? selectedSubCategory;
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    double? minPrice = double.tryParse(minPriceController.text);
    double? maxPrice = double.tryParse(maxPriceController.text);

    context.read<DataProvider>().filterProductsByDetails(
      categoryId: selectedCategory?.sId,
      subCategoryId: selectedSubCategory?.sId,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }

  void _clearFilters() {
    setState(() {
      selectedCategory = null;
      selectedSubCategory = null;
      minPriceController.clear();
      maxPriceController.clear();
    });
    context.read<DataProvider>().filterProducts('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    //  padding: const EdgeInsets.all(defaultPadding),
      // decoration: const BoxDecoration(
      //  // color: secondaryColor,
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filter Products",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: defaultPadding),
          Consumer<DataProvider>(
            builder: (context, dataProvider, child) {
              // Filter subcategories based on selected category if any
              List<SubCategory> subCategories = dataProvider.allSubCategories;
              if (selectedCategory != null) {
                // Assuming dataProvider.allSubCategories contains all subcategories
                // And SubCategory model has categoryId field with sId
                subCategories = dataProvider.allSubCategories
                    .where((sub) => sub.categoryId?.sId == selectedCategory?.sId)
                    .toList();
              }

              return Wrap(
                spacing: defaultPadding,
                runSpacing: defaultPadding,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField<Category>(
                      value: selectedCategory,
                      hint: const Text("Select Category"),
                      isExpanded: true,
                      items: [
                        const DropdownMenuItem<Category>(
                          value: null,
                          child: Text("All"),
                        ),
                        ...dataProvider.allCategories.map((Category category) {
                          return DropdownMenuItem<Category>(
                            value: category,
                            child: Text(
                              category.name ?? '',
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }),
                      ],
                      onChanged: (Category? newValue) {
                        setState(() {
                          selectedCategory = newValue;
                          // If selected subcategory doesn't belong to new category, clear it
                          if (selectedSubCategory != null &&
                              newValue != null &&
                              selectedSubCategory?.categoryId?.sId !=
                                  newValue.sId) {
                            selectedSubCategory = null;
                          }
                        });
                        _applyFilters();
                      },
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        labelText: "Category",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField<SubCategory>(
                      value: selectedSubCategory,
                      hint: const Text("Select SubCategory"),
                      isExpanded: true,
                      items: subCategories.map((SubCategory subCategory) {
                        return DropdownMenuItem<SubCategory>(
                          value: subCategory,
                          child: Text(
                            subCategory.name ?? '',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (SubCategory? newValue) {
                        setState(() {
                          selectedSubCategory = newValue;
                        });
                        _applyFilters();
                      },
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        labelText: "Sub Category",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: minPriceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Min Price",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      onChanged: (_) => _applyFilters(),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: maxPriceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Max Price",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      onChanged: (_) => _applyFilters(),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _clearFilters,
                    icon: const Icon(Icons.clear, color: Colors.white,),
                    label: const Text("Clear", style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding, vertical: defaultPadding),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
