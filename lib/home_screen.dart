import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  addItem() {}

  removeItem() {}

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
            title: Text('Animated List'),
            centerTitle: true,
          ),
        ],
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          children: List.generate(
            30,
            (index) => Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://store.bellestoreinc.com/wp-content/uploads/2019/09/iphone11-select-2019-family-1.jpeg'),
                ),
                title: Text('Iphone'),
                trailing: IconButton(
                  onPressed: () => removeItem(),
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
