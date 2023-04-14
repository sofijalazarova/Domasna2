
import 'package:equatable/equatable.dart';

class Category extends Equatable {

  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});


  @override
  List<Object?> get props => [name, imageUrl]; 

  static List<Category> categories = [
    Category(name: 'Grilled Chicken', imageUrl: 'https://www.inspiredtaste.net/wp-content/uploads/2021/06/Grilled-Chicken-Recipe-5-1200-1200x800.jpg'),
     Category(name: 'Chocolate Chip Cookies', imageUrl: 'https://images.aws.nestle.recipes/original/5b069c3ed2feea79377014f6766fcd49_Original_NTH_Chocolate_Chip_Cookie.jpg'),
      Category(name: 'Thailand Noodles', imageUrl: 'https://www.thespruceeats.com/thmb/kpnl0p1hMBsESB9wbWRN_0Zdoc4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/thai-stir-fried-noodles-with-vegetables-3217111_hero_01-8f13deb4bcb84fca82f244a504b0d886.jpg')
  ];

}