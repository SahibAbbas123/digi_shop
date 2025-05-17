class CartModel {
  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  final int id;
  final int userId;
  final DateTime? date;
  final List<Product> products;
  final int v;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"] ?? 0,
      userId: json["userId"] ?? 0,
      date: DateTime.tryParse(json["date"] ?? ""),
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date?.toIso8601String(),
        "products": products.map((x) => x?.toJson()).toList(),
        "__v": v,
      };

  @override
  String toString() {
    return "$id, $userId, $date, $products, $v, ";
  }
}

class Product {
  Product({
    required this.productId,
    required this.quantity,
  });

  final int productId;
  final int quantity;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json["productId"] ?? 0,
      quantity: json["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };

  @override
  String toString() {
    return "$productId, $quantity, ";
  }
}

/*
[
	{
		"id": 1,
		"userId": 1,
		"date": "2020-03-02T00:00:00.000Z",
		"products": [
			{
				"productId": 1,
				"quantity": 4
			},
			{
				"productId": 2,
				"quantity": 1
			},
			{
				"productId": 3,
				"quantity": 6
			}
		],
		"__v": 0
	},
	{
		"id": 2,
		"userId": 1,
		"date": "2020-01-02T00:00:00.000Z",
		"products": [
			{
				"productId": 2,
				"quantity": 4
			},
			{
				"productId": 1,
				"quantity": 10
			},
			{
				"productId": 5,
				"quantity": 2
			}
		],
		"__v": 0
	},
	{
		"id": 3,
		"userId": 2,
		"date": "2020-03-01T00:00:00.000Z",
		"products": [
			{
				"productId": 1,
				"quantity": 2
			},
			{
				"productId": 9,
				"quantity": 1
			}
		],
		"__v": 0
	},
	{
		"id": 4,
		"userId": 3,
		"date": "2020-01-01T00:00:00.000Z",
		"products": [
			{
				"productId": 1,
				"quantity": 4
			}
		],
		"__v": 0
	},
	{
		"id": 5,
		"userId": 3,
		"date": "2020-03-01T00:00:00.000Z",
		"products": [
			{
				"productId": 7,
				"quantity": 1
			},
			{
				"productId": 8,
				"quantity": 1
			}
		],
		"__v": 0
	},
	{
		"id": 6,
		"userId": 4,
		"date": "2020-03-01T00:00:00.000Z",
		"products": [
			{
				"productId": 10,
				"quantity": 2
			},
			{
				"productId": 12,
				"quantity": 3
			}
		],
		"__v": 0
	},
	{
		"id": 7,
		"userId": 8,
		"date": "2020-03-01T00:00:00.000Z",
		"products": [
			{
				"productId": 18,
				"quantity": 1
			}
		],
		"__v": 0
	}
]*/
