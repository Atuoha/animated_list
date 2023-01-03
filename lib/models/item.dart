class Item {
  String title;
  String subtitle;
  String imgUrl;
  bool isFav;

  Item({
    required this.title,
    required this.subtitle,
    required this.imgUrl,
    this.isFav = false,
  });


  toggleIsFav(){
    isFav = !isFav;
  }
}
