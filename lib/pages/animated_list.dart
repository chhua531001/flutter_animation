import 'package:flutter/material.dart';

import '../models/animatedlist_model.dart';

class MyAnimatedList extends StatefulWidget {
  const MyAnimatedList({super.key});

  @override
  State<MyAnimatedList>  createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList>
    with TickerProviderStateMixin {
  final List<User> selectedUsers = [];
  List<User> users = [
    User(
      name: 'Jasmine Smith',
      username: ' @JazzyS',
      image:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7-aGpatw32H3vwj6ZVhJew0zFKD-R1UlzL-N1AUu2kQ&s",
    ),
    User(
      name: 'Lucas Johnson',
      username: '@LucJ',
      image:
      "https://a.storyblok.com/f/191576/1200x800/faa88c639f/round_profil_picture_before_.webp",
    ),
    User(
      name: 'Emily Rodriguez',
      username: '@EmiRod',
      image:
      "https://img.freepik.com/free-photo/freedom-concept-with-hiker-mountain_23-2148107064.jpg",
    ),
    User(
      name: 'Ethan Brown',
      username: ' @EthBr',
      image:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU",
    ),
    User(
      name: 'Ava Anderson',
      username: '@mikayla',
      image:
      "https://www.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-600nw-1836020740.jpg",
    ),
    User(
      name: 'Olivia Garcia',
      username: '@AvaA',
      image:
      "https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?s=612x612&w=0&k=20&c=QjebAlXBgee05B3rcLDAtOaMtmdLjtZ5Yg9IJoiy-VY=",
    )
  ];


  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> selectedListKey =
      GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated List Demo"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 35),
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const Text("Selected members"),
                    const SizedBox(height: 20),
                    // display selected items
                    Expanded(
                      child: AnimatedList(
                        scrollDirection: Axis.horizontal,
                        key: selectedListKey,
                        initialItemCount: selectedUsers.length,
                        itemBuilder: (context, index, animation) {
                          return displaySelectedUser(
                            user: selectedUsers[index],
                            index: index,
                            animation: animation,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // display items
              const SizedBox(height: 25),
              Expanded(
                child: AnimatedList(
                  key: listKey,
                  initialItemCount: users.length,
                  itemBuilder: (context, index, animation) {
                    return displayUser(
                      user: users[index],
                      index: index,
                      animation: animation,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  displaySelectedUser({
    required User user,
    index,
    animation,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: FadeTransition(
        opacity: animation,
        child: Column(
          children: [
            SizedBox(
              width: 50,
              child: Text(
                user.name,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      backgroundImage: NetworkImage(user.image),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      listKey.currentState?.insertItem(users.length,
                          duration: const Duration(milliseconds: 500));
                      selectedListKey.currentState?.removeItem(
                        index,
                        (context, animation) => displaySelectedUser(
                            user: user, index: index, animation: animation),
                        duration: const Duration(milliseconds: 300),
                      );

                      selectedUsers.remove(user);
                      users.add(user);
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  displayUser({
    required User user,
    index,
    animation,
  }) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          if (selectedUsers.length > 4) return;

          listKey.currentState?.removeItem(
            index,
            (context, animation) =>
                displayUser(user: user, index: index, animation: animation),
            duration: const Duration(milliseconds: 300),
          );

          selectedListKey.currentState?.insertItem(
            selectedUsers.length,
            duration: const Duration(milliseconds: 500),
          );

          selectedUsers.add(user);
          users.remove(user);
        })
      },
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: Row(children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                user.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                user.username,
                style: const TextStyle(color: Colors.black45),
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
