import 'package:flutter/material.dart';
import 'package:smart_me/colors.dart';
import 'package:smart_me/data/contact_data.dart';
import 'package:smart_me/strings.dart';

class AndroidContactScreen extends StatelessWidget {
  AndroidContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      color: const Color(0xFFE6E6E6),
      child: Column(
        children: [
          SizedBox(
            height: statusBarHeight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.network(
                      "https://picsum.photos/100/100",
                      height: 70,
                      width: 70,
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "My Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    iconSize: 24,
                  ),
                  const Visibility(
                    visible: false,
                    child: Text(
                      contacts,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    iconSize: 24,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    iconSize: 24,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    iconSize: 24,
                  ),
                ],
              )
            ],
          ),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0)),
                  child: contactList))
        ],
      ),
    );
  }

  Widget contactList = ListView.builder(
    itemCount: data.length,
    itemBuilder: ((context, index) =>
        AndroidContactListElement(contactData: data[index])),
  );
}

class AndroidContactListElement extends StatelessWidget {
  final ContactData contactData;

  const AndroidContactListElement({super.key, required this.contactData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.0),
                  child: Image.network(
                    contactData.image,
                    height: 32,
                    width: 32,
                  )),
            ),
            Text(contactData.name),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 56.0, right: 24.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: lightGrey,
          ),
        )
      ],
    );
  }
}
