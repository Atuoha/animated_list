import 'package:flutter/material.dart';

import 'data/list_items.dart';
import 'models/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listKey = GlobalKey<AnimatedListState>();
  List<Item> items = listItems;

  addItem() {
    const newIndex = 1;
    final item = (List.of(items)..shuffle()).first;
    items.insert(newIndex, item);
    listKey.currentState!
        .insertItem(newIndex, duration: const Duration(milliseconds: 600));
  }

  void removeItem(int index) {
    items.removeAt(index);
    listKey.currentState!.removeItem(
        index, (context, animation) => listCard(index, animation),
        duration: const Duration(milliseconds: 600));
  }

  showDetails(Item item) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text(item.title)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.network(item.imgUrl),
          const SizedBox(height: 10),
          Text(item.subtitle)
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addItem(),
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(slivers: [
         const SliverAppBar(
          expandedHeight: 150,
          floating: true,
          title: Text('Iphone Series'),
          centerTitle: true,
          pinned: true,
        ),
        SliverToBoxAdapter(

            child: Column(
              children: [
                AnimatedList(
                  shrinkWrap: true,
                  primary: false,
                  key: listKey,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  initialItemCount: items.length,
                  itemBuilder: (context, index, animation) =>
                      listCard(index, animation),
                ),
              ],
            ),
        )
      ]),
    );
  }

  SizeTransition listCard(int index, Animation<double> animation) {
    // return SlideTransition(
    //   key: ValueKey(items[index].imgUrl),
    //   position: Tween<Offset>(
    //     begin: const Offset(-1, 0),
    //     end: Offset.zero,
    //   ).animate(
    //     CurvedAnimation(parent: animation, curve: Curves.easeOut),
    //   ),
    return SizeTransition(
      sizeFactor: animation,
      key: ValueKey(items[index].imgUrl),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: () => showDetails(items[index]),
          contentPadding: const EdgeInsets.all(10),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(items[index].imgUrl),
          ),
          title: Text(
            items[index].title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(items[index].subtitle),
          trailing: IconButton(
            onPressed: () => removeItem(index),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

// https://marketingedge.com.ng/wp-content/uploads/2021/10/iOS-Logo-2010.jpg

// SliverAppBar

// NestedScrollView(
//   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
//   [
//   const SliverAppBar(
//   title: Text('Iphone Series'),
//   centerTitle: true,
//   ),
// ],
