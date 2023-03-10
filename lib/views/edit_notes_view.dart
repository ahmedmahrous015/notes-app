import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widget/custom_app_bar.dart';
import 'package:notes_app/widget/custom_text_field.dart';
import 'package:notes_app/widget/edit_note_colors_list.dart';

class EidtNotesVeiw extends StatefulWidget {
  const EidtNotesVeiw({super.key, required this.note});
  final NoteModel note;

  @override
  State<EidtNotesVeiw> createState() => _EidtNotesVeiwState();
}

class _EidtNotesVeiwState extends State<EidtNotesVeiw> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              text: 'Edit Notes',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                subTitle = value;
              },
              hint: widget.note.subTitle,
              maxlines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            EditNoteColorsList(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}

