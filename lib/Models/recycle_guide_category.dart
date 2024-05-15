class RecycleGuideCategory {
  String name;
  String allowedItems;
  String disAllowedItems;
  List<RecycleGuideCategory> subCategories;

  RecycleGuideCategory(
      this.name, this.allowedItems, this.disAllowedItems, this.subCategories);

  factory RecycleGuideCategory.fromMap(Map<String, dynamic> map) {
    List<RecycleGuideCategory> subCategories = [];
    if (map['subCategories'] != null) {
      subCategories = List<RecycleGuideCategory>.from(
        map['subCategories']
            .map((subCategory) => RecycleGuideCategory.fromMap(subCategory)),
      );
    }

    return RecycleGuideCategory(
      map['name'] ?? '',
      map['allowedItems'] ?? '',
      map['disAllowedItems'] ?? '',
      subCategories,
    );
  }
}
