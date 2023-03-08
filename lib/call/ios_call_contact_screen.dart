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
