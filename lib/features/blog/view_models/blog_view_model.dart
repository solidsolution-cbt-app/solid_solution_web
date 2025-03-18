import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/features/blog/model/blog_model.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class BlogViewModel extends BaseModel {
  bool loadGetBlog = false;
  toogleGetBlog(bool value) {
    loadGetBlog = value;
    notifyListeners();
  }

  List<BlogModel> blogs = [];

  Future<void> getBlogs() async {
    toogleGetBlog(true);
    try {
      var data = await apiService.getBlog();
      if (data.isSuccessful) {
        List<dynamic> blogData = data.model as List<dynamic>;
        blogs = blogData.map((e) => BlogModel.fromJson(data: e)).toList();
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
    }
    toogleGetBlog(false);
  }

  Future<bool> updateBlog(
      {required String blogId, required BlogModel request}) async {
    try {
      var data = await apiService.updateBlog(
        blogId: blogId,
        blog: request,
      );
      if (data.isSuccessful) {
        dialogService.showSuccessDialog(
          successMessage: data.message,
        );
        await getBlogs();
        return true;
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
        return false;
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
    }
    return false;
  }

  Future<bool> uploadBlog({required BlogModel request}) async {
    try {
      var data = await apiService.postBlog(blog: request);
      if (data.isSuccessful) {
        dialogService.showSuccessDialog(
          successMessage: data.message,
        );
        await getBlogs();
        return true;
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
        return false;
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
    }
    return false;
  }

  Future<bool> deleteBlogPost({required String blogId}) async {
    try {
      var data = await apiService.deleteBlog(blogId: blogId);
      if (data.isSuccessful) {
        await getBlogs();
        return true;
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
    }
    return false;
  }
}
