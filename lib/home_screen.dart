import 'package:flutter/material.dart';

import 'data/list_items.dart';
import 'models/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey listKey = GlobalKey<AnimatedListState>();
  List<Item> items = listItems;

  addItem() {}

  removeItem(int index) {
    items.removeAt(index);
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
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addItem(),
        child: const Icon(Icons.add),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          const SliverAppBar(
            title: Text('Iphone Series'),
            centerTitle: true,
          ),
        ],
        body: AnimatedList(
          key: listKey,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          initialItemCount: items.length,
          itemBuilder: (context, index, animation) => Card(
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
        ),
      ),
    );
  }
}
