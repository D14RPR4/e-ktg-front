import 'package:e_ktg_mobile/core/components/custom_scaffold_commet_alam.dart';

import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';
import 'package:e_ktg_mobile/data/model/request/comment/comment_alam_request_model.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/delete_comment/delete_comment_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/post_comment/post_comment_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/get_comment/get_comment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBuatanPage extends StatefulWidget {
  final String? postId;

  const CommentBuatanPage({
    Key? key,
    this.postId,
  }) : super(key: key);

  @override
  State<CommentBuatanPage> createState() => _CommentBuatanPageState();
}

class _CommentBuatanPageState extends State<CommentBuatanPage> {
  int? userId;
  final TextEditingController _txtCommentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchAuthData();
    _getComments();
  }

  void _handleDeleteComment(BuildContext context, String commentId) {
    context
        .read<DeleteCommentBloc>()
        .add(DeleteCommentEvent.deleteCommentAlam(commentId));
  }

  Future<void> _fetchAuthData() async {
    try {
      final authResponse = await AuthLocalDatasource().getAuthData();
      setState(() {
        userId = authResponse.user.id;
      });
    } catch (error) {
      print('Error fetching auth data: $error');
    }
  }

  void _getComments() {
    if (widget.postId != null) {
      context
          .read<GetCommentBloc>()
          .add(GetCommentEvent.getAllCommentAlam(widget.postId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldBuatan(
      showBackButton: true,
      appBarTitle: const Text('Comments'),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<GetCommentBloc, GetCommentState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Center(child: CircularProgressIndicator()),
                  loading: () => Center(child: CircularProgressIndicator()),
                  success: (comments) {
                    return SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: comments.comment.length,
                            itemBuilder: (context, index) {
                              final comment = comments
                                  .comment[comments.comment.length - 1 - index];
                              return _buildMessageBubble(comment);
                            },
                          ),
                          SizedBox(height: 16), // Spacer for keyboard
                        ],
                      ),
                    );
                  },
                  error: (message) => Center(child: Text(message)),
                );
              },
            ),
          ),
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(comment) {
    final isMyComment = comment.user.id == userId;
    return Align(
      alignment: isMyComment ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMyComment ? Colors.blue : Color.fromARGB(255, 0, 200, 130),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isMyComment)
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _confirmDeleteComment(context, comment.id),
                    iconSize: 18,
                    color: Colors.white,
                    tooltip: 'Delete',
                  ),
                Text(
                  comment.user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMyComment ? Colors.white : Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              comment.comment,
              style: TextStyle(
                fontSize: 16,
                color: isMyComment ? Colors.white : Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              comment.createdAt.toString().substring(0, 16),
              style: TextStyle(
                color: isMyComment ? Colors.white : Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _txtCommentController,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
          ),
          SizedBox(width: 12),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: _postComment,
          ),
        ],
      ),
    );
  }

  void _postComment() {
    if (_txtCommentController.text.isNotEmpty) {
      final requestModel = CommentAlamRequestModel(
        comment: _txtCommentController.text,
      );

      context
          .read<PostCommentBloc>()
          .add(PostCommentEvent.postCommentAlam(requestModel, widget.postId!));
      _txtCommentController.clear();
      // Refresh comments after posting comment
      _getComments();
    }
  }

  void _confirmDeleteComment(BuildContext context, String commentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to delete this comment?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleDeleteComment(context, commentId);
                Navigator.of(context).pop();
                // Refresh comments after deleting comment
                _getComments();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
