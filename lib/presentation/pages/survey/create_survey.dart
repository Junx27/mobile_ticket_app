import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_ticket_app/presentation/bloc/survey/survey_bloc.dart';
import 'package:mobile_ticket_app/presentation/bloc/survey/survey_event.dart';
import 'package:mobile_ticket_app/presentation/bloc/survey/survey_state.dart';

class CreateSurveyForm extends StatefulWidget {
  const CreateSurveyForm({Key? key}) : super(key: key);

  @override
  State<CreateSurveyForm> createState() => _CreateSurveyFormState();
}

class _CreateSurveyFormState extends State<CreateSurveyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryIdController = TextEditingController();

  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyBloc, SurveyState>(
      listener: (context, state) {
        if (state is SurveyCreated) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pop(context);
        } else if (state is SurveyError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Create Survey")),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                    validator: (value) =>
                        value!.isEmpty ? "Name tidak boleh kosong" : null,
                  ),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Price"),
                    validator: (value) =>
                        value!.isEmpty ? "Price tidak boleh kosong" : null,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: "Description"),
                  ),
                  TextFormField(
                    controller: _categoryIdController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Category ID"),
                    validator: (value) => value!.isEmpty
                        ? "Category ID tidak boleh kosong"
                        : null,
                  ),
                  const SizedBox(height: 16),
                  _selectedImage != null
                      ? Image.file(
                          _selectedImage!,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : const Text("No image selected"),
                  TextButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.image),
                    label: const Text("Pilih Gambar"),
                  ),
                  const SizedBox(height: 20),
                  state is SurveyLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _selectedImage != null) {
                              context.read<SurveyBloc>().add(
                                CreateSurveyEvent(
                                  name: _nameController.text,
                                  price: int.parse(_priceController.text),
                                  description: _descriptionController.text,
                                  imageFile: _selectedImage!, // kirim File
                                  categoryId: int.parse(
                                    _categoryIdController.text,
                                  ),
                                ),
                              );
                            } else if (_selectedImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Pilih gambar dulu"),
                                ),
                              );
                            }
                          },
                          child: const Text("Submit"),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
