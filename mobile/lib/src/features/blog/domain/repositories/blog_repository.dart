import 'package:dartz/dartz.dart';

import '../domain.dart';


abstract class BlogRepository {
  Future<Either<String,List<Blog>>> viewAllBlogs();
}
