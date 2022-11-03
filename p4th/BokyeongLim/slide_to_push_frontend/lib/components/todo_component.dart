import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
class TodoComponent extends StatefulWidget {
  const TodoComponent({Key? key}) : super(key: key);

  static bool isChecked = false;
  @override
  State<TodoComponent> createState() => _TodoComponentState();
}

class _TodoComponentState extends State<TodoComponent> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(color: ColorPicker.defaultBlack, width: 2.5)
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              child:Container(
                alignment:Alignment.centerLeft,
                color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "내가 할일들dmf dslghaslhielghlaseidflhesilghalgdsg",
                      style: TextStyle(
                          fontFamily: 'AppleSDGothicNeoM',
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: ColorPicker.defaultBlack,
                        ),
                      ),
                  ],
                ),
              ),
            flex: 8,
             ),
          Flexible(
            child:Container(
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading, //checkbox at left
                value: TodoComponent.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    TodoComponent.isChecked = value!;
                  });
                },
              )
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
