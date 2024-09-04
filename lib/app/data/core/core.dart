// ignore_for_file: constant_identifier_names

enum SortBy {
  accending(1),
  decending(-1);

  const SortBy(this.value);
  final int value;
}

enum ProductSortOptions {
  createdAt('createdAt'),
  updatedAt('updatedAt'),
  productName('title'),
  price('mrp'),
  status('status');

  const ProductSortOptions(this.value);
  final String value;
}

extension ProductSortOptionsX on ProductSortOptions {
  String get displayName {
    switch (this) {
      case ProductSortOptions.createdAt:
        return 'Created Date';
      case ProductSortOptions.updatedAt:
        return 'Last Updated';
      case ProductSortOptions.productName:
        return 'Product Name';
      case ProductSortOptions.price:
        return 'Price';
      case ProductSortOptions.status:
        return 'Status';
    }
  }
}

enum CatalogSortOptions {
  createdAt('createdAt'),
  updatedAt('updatedAt'),
  title('title'),
  status('status'),
  totalProduct('total_product');

  const CatalogSortOptions(this.value);
  final String value;
}

extension CatalogSortOptionsX on CatalogSortOptions {
  String get displayName {
    switch (this) {
      case CatalogSortOptions.createdAt:
        return 'Created Date';
      case CatalogSortOptions.updatedAt:
        return 'Last Updated';
      case CatalogSortOptions.title:
        return 'Name';
      case CatalogSortOptions.status:
        return 'Status';
      case CatalogSortOptions.totalProduct:
        return 'Total Product';
    }
  }
}
