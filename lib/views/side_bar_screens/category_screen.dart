import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = '\categoryScreen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String categoryName;
  dynamic _bannerImage;
  dynamic _image;
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  pickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _bannerImage = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: _image != null
                      ? Image.memory(_image)
                      : Text('Category image'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      categoryName = value;
                    },
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Please enter a category name';
                      }
                    },
                    decoration:
                        InputDecoration(labelText: 'Enter Category name'),
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: Text('cancel')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(categoryName);
                    }
                  },
                  child: const Text(
                    'save',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('pick image')),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 3, 3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: _bannerImage != null
                  ? Image.memory(_bannerImage)
                  : const Text(
                      'Category Banner',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  pickBannerImage();
                },
                child: const Text('Pick Image')),
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
