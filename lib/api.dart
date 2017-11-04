library example.data_store.simple;

import 'dart:io';
import 'dart:async';
import 'package:jaguar_mongo_data_store/resource.dart';
import '../common/post/post.dart';
import 'package:jaguar/jaguar.dart' hide Post;
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:jaguar_data_store/client.dart';
import 'package:http/http.dart' as http;

final String kMongoUrl = "mongodb://localhost:27018/example";

@Api(path: '/api')
class ExampleApi {
  @IncludeApi(path: '/post')
  final MongoResource s =
  new MongoResource(kMongoUrl, 'posts', serializer, mongoSerializer);
}

Future<Null> server() async {
  Jaguar server = new Jaguar();
  server.addApi(reflectJaguar(new ExampleApi()));
  await server.serve();
}