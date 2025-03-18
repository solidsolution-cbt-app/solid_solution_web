import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/features/blog/view_models/blog_view_model.dart';
import 'package:solidsolutionweb/features/blog/widget/blog_card.dart';
import 'package:solidsolutionweb/features/blog/widget/add_new_blog_card.dart';

@RoutePage()
class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BlogViewModel>(
      onModelReady: (model) {
        model.getBlogs();
      },
      builder: (context, model, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: model.loadGetBlog
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Wrap(
                  spacing: 50,
                  runSpacing: 50,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    AddNewBlogCard(
                      onTap: () {
                        context.pushRoute(
                          UploadBlogRoute(),
                        );
                      },
                    ),
                    ...model.blogs.map(
                      (e) => BlogCard(
                        blog: e,
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
