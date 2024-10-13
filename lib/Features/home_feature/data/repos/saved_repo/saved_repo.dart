import 'package:flutter/material.dart';

abstract class SavedRepo {
  Future<void> addToFav({@required dynamic body});
}
