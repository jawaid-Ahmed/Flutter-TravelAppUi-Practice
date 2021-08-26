
class Hotel{
  String name;
  String imageUrl;
  String address;
  int price;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price
  });
}
final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/karachihotel.jpg',
    name: 'Karachi Hotel',
    address: 'Karachi, Pakistan',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/luxeriushotel.jpg',
    name: 'Five Star hotel',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/sarenahotel.jpg',
    name: 'Sarena hotel',
    address: 'Islamabad, Pakistan',
    price: 240,
  ),
];