import 'package:demo/widgets/recipe/recipe_modify_form.dart';
import 'package:flutter/material.dart';

import '../../utilities/check_validate.dart';

class TitleEditingController extends StatefulWidget {

  final String titleText;

  const TitleEditingController({Key? key, required this.titleText}) : super(key: key);

  @override
  State<TitleEditingController> createState() => _TitleEditingControllerState();
}

class _TitleEditingControllerState extends State<TitleEditingController> {
  final FocusNode _titleFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    RecipeModifyFormState? modify =
    context.findAncestorStateOfType<RecipeModifyFormState>();
    TextEditingController _titleController = TextEditingController(text: widget.titleText);
    return TextFormField(
      controller: _titleController,
      validator: (value) => CheckValidate().validateTitle(_titleFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (text) {
        modify?.title = text;
      },
      decoration:
      const InputDecoration(hintText: "글 제목", border: InputBorder.none),
    );
  }
}
