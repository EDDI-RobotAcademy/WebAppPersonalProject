import 'package:demo/widgets/recipe/recipe_register_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdownPage extends StatefulWidget {


  const CustomDropdownPage({Key? key}) : super(key: key);

  @override
  State<CustomDropdownPage> createState() => _CustomDropdownPageState();
}

class _CustomDropdownPageState extends State<CustomDropdownPage> {

  static const List<String> _dropdownList = [
    '한식',
    '양식',
    '일식',
    '중식',
    '기타'
  ];


  String dropdownValue = '한식';


  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  static const double _dropdownWidth = 200;
  static const double _dropdownHeight = 48;
  bool isActive = false;


  void _showOverlay() async {
    if (!isActive) {
      isActive = true;
      _overlayEntry = _customDropdown();
      Overlay.of(context)?.insert(_overlayEntry!);


      await Future.delayed(const Duration(seconds: 2));
      _closeOverlay();
      isActive = false;
      RecipeRegisterFormState.getCategory(dropdownValue);

    }
  }


  void _closeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _overlayEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RecipeRegisterFormState? registerFormState = context.findAncestorStateOfType<RecipeRegisterFormState>();
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: (){
          _closeOverlay();
          },
          child: InkWell(
            onTap: () {
              _showOverlay();
            },
            child: CompositedTransformTarget(
              link: _layerLink,
              child: Container(
                width: size.width * 0.4,
                height: _dropdownHeight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 선택값.
                    Text(
                      dropdownValue,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 22 / 16,
                        color: Colors.black,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_downward,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }


  OverlayEntry _customDropdown() {

    return OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        width: _dropdownWidth,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(0, _dropdownHeight),
          child: Material(
            color: Colors.white,
            child: Container(
              height: (22.0 * _dropdownList.length) +
                  (21 * (_dropdownList.length - 1)) +
                  20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: _dropdownList.length,
                itemBuilder: (context, index) {
                  return CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    pressedOpacity: 1,
                    minSize: 0,
                    onPressed: () {
                      setState(() {
                        dropdownValue = _dropdownList.elementAt(index);
                      }
                      );
                      _closeOverlay();
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _dropdownList.elementAt(index),
                        style: const TextStyle(
                          fontSize: 16,
                          height: 22 / 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(
                      color: Colors.grey,
                      height: 20,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
