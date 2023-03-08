import 'package:flutter/material.dart';
import 'package:smart_me/colors.dart';
import 'package:smart_me/data/contact_data.dart';
import 'package:smart_me/strings.dart';

class IOSContactScreen extends StatelessWidget {
  IOSContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        SizedBox(
          height: statusBarHeight,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
              iconSize: 32,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              contacts,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: search,
                hintStyle: const TextStyle(fontSize: 20.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.transparent)),
                filled: true,
                fillColor: lightGrey,
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Divider(
            thickness: 1,
            height: 1,
            color: lightGrey,
          ),
        ),
        Expanded(child: contactList)
      ],
    );
  }

  Widget contactList = ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) =>
        IOSContactListElement(contactData: data[index]),
  );
}

class IOSContactListElement extends StatelessWidget {
  final ContactData contactData;

  const IOSContactListElement({super.key, required this.contactData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              contactData.name,
              textAlign: TextAlign.start,
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
            color: lightGrey,
          )
        ],
      ),
    );
  }
}

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
