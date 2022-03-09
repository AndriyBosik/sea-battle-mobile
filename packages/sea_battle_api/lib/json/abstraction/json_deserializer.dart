import 'package:flutter/material.dart';

abstract class JsonDeserializer<T> {
  T? fromJson(Map<String, dynamic>? json);
}