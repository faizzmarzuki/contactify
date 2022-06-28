import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:contactify/user.dart';

class ContactApi {
  static Future<List<Contact>> getContactLocally(BuildContext context) async {
    final assetbundle = DefaultAssetBundle.of(context);
    final data = await assetbundle.loadString('assets/data.json');
    final body = json.decode(data);

    return body.map<Contact>(Contact.fromJson).toList();
  }
}