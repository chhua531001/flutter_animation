import 'package:flutter/material.dart';

import '../models/animatedlist_model.dart';

class ListViewAnimation extends StatefulWidget {
  const ListViewAnimation({super.key});

  @override
  State<ListViewAnimation> createState() => _ListViewAnimationState();
}

class _ListViewAnimationState extends State<ListViewAnimation> {
  double width = 0;
  bool myAnimation = false;

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
  @override
  void initState() {
      super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        myAnimation = true;
      });
    });
  
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Animation Demo"),
      ),
      backgroundColor: const Color.fromARGB(255, 34, 36, 49),
      body: SafeArea(
        child: ListView(
            physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            // const Center(
            //   child: Text(
            //     "ListView Animation",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //       fontSize: 25,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final myUser = users[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                      duration:  Duration(milliseconds: 400 + (index *250)),
                      curve: Curves.decelerate,
                      transform: Matrix4.translationValues(myAnimation ?0:width, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(myUser.image),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myUser.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  myUser.username,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
// now we add the animation 
// that's it for today vide thanks for watching.