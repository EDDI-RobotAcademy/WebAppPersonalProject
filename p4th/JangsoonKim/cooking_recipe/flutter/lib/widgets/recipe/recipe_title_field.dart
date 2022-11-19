import 'package:demo/widgets/recipe/recipe_register_form.dart';
import 'package:flutter/material.dart';

import '../../utilities/check_validate.dart';

class RecipeTitleField extends StatefulWidget {
  const RecipeTitleField({Key? key}) : super(key: key);

  @override
  State<RecipeTitleField> createState() => _RecipeTitleFieldState();
}

class _RecipeTitleFieldState extends State<RecipeTitleField> {
  final FocusNode _titleFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    RecipeRegisterFormState? recipe = context.findAncestorStateOfType<RecipeRegisterFormState>();
    var _controller = TextEditingController();
    return TextFormField(
      controller: _controller,
      validator: (value) =>
          CheckValidate().validateTitle(_titleFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (text){
        recipe?.title = text;
      },
      decoration: InputDecoration(
        hintText: "글 제목",
      ),
    );
  }
}
