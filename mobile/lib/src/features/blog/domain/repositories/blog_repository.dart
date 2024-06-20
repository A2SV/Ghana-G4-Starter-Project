import 'package:dartz/dartz.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog.dart';



abstract class BlogRepository {
  Future<Either<String,Blog>> viewBlog(int id);
  Future<Either<String,List<Blog>>> viewAllBlogs();
}
