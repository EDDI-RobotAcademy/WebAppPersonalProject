import 'package:demo/widgets/recipe/recipe_register_form.dart';
import 'package:flutter/material.dart';

import '../../utilities/check_validate.dart';

class RecipeContentField extends StatefulWidget {
  const RecipeContentField({Key? key}) : super(key: key);

  @override
  State<RecipeContentField> createState() => _RecipeContentFieldState();
}

class _RecipeContentFieldState extends State<RecipeContentField> {
  FocusNode _contentFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    RecipeRegisterFormState? recipe = context.findAncestorStateOfType<RecipeRegisterFormState>();
    return Expanded(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 20,
        controller: _controller,
        onChanged: (text){
          recipe?.content = text;
        },
        validator: (value) =>
            CheckValidate().validateContent(_contentFocus, value!),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: "레시피를 작성해주세요.",
            border: InputBorder.none),
      ),
    );
  }
}
