import 'package:demo/widgets/recipe/recipe_modify_form.dart';
import 'package:flutter/material.dart';

import '../../utilities/check_validate.dart';

class ContentEditingController extends StatefulWidget {

  final String contentText;

  const ContentEditingController({Key? key, required this.contentText}) : super(key: key);

  @override
  State<ContentEditingController> createState() => _ContentEditingControllerState();
}

class _ContentEditingControllerState extends State<ContentEditingController> {
  FocusNode _contentFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    RecipeModifyFormState? modify =
    context.findAncestorStateOfType<RecipeModifyFormState>();
    TextEditingController _contentController = TextEditingController(text: widget.contentText);
    return Expanded(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 20,
        controller: _contentController,
        onChanged: (text){
          modify?.content = text;
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
