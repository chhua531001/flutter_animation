import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/animatedlist_model.dart';

class ShimmerLoader extends StatefulWidget {
  const ShimmerLoader({
    super.key,
  });

  @override
  State<ShimmerLoader> createState() => _ShimmerLoaderState();
}

class _ShimmerLoaderState extends State<ShimmerLoader> {
  bool isLoaded = false;

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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer Loader Demo"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [

          ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final myUser = users[index];
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                height: 70.0,
                child: isLoaded ? getDataItems(myUser) : myShimmerLoader(),
              );
            },
          )
        ],
      ),
    );
  }

  Row getDataItems(User myUser) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(myUser.image),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 15),
            SizedBox(
              child: Text(myUser.name),
            ),
            SizedBox(
              child: Text(myUser.username),
            ),
          ],
        )
      ],
    );
  }

  myShimmerLoader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[300]!,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            children: [
              const SizedBox(height: 15),
              Container(height: 20, color: Colors.white),
              const SizedBox(height: 10),
              Container(height: 15, width: 80, color: Colors.white),
            ],
          ))
        ],
      ),
    );
  }
}
