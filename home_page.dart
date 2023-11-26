import 'package:flutter/material.dart';
import 'package:taskit/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController recurrenceController = TextEditingController();

  List<Task> tasks = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Tasks List')),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            TextField(
              controller: deadlineController,
              decoration: const InputDecoration(
                hintText: 'Deadline',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            TextField(
              controller: priorityController,
              decoration: const InputDecoration(
                hintText: 'Priority',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                hintText: 'Category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            TextField(
              controller: recurrenceController,
              decoration: const InputDecoration(
                hintText: 'Recurrence',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String title = titleController.text.trim();
                      String content = contentController.text.trim();
                      String deadline = deadlineController.text.trim();
                      String priority = priorityController.text.trim();
                      String category = categoryController.text.trim();
                      String recurrence = recurrenceController.text.trim();
                      if (title.isNotEmpty &&
                          content.isNotEmpty &&
                          deadline.isNotEmpty &&
                          priority.isNotEmpty &&
                          category.isNotEmpty &&
                          recurrence.isNotEmpty) {
                        setState(() {
                          titleController.text = '';
                          contentController.text = '';
                          deadlineController.text = '';
                          priorityController.text = '';
                          categoryController.text = '';
                          recurrenceController.text = '';
                          tasks.add(Task(
                              title: title,
                              content: content,
                              deadline: deadline,
                              priority: priority,
                              category: category,
                              recurrence: recurrence));
                        });
                      }
                    },
                    child: const Text('Add new task')),
                ElevatedButton(
                    onPressed: () {
                      String title = titleController.text.trim();
                      String content = contentController.text.trim();
                      String deadline = deadlineController.text.trim();
                      String priority = priorityController.text.trim();
                      String category = categoryController.text.trim();
                      String recurrence = recurrenceController.text.trim();
                      if (title.isNotEmpty &&
                          content.isNotEmpty &&
                          deadline.isNotEmpty &&
                          priority.isNotEmpty &&
                          category.isNotEmpty &&
                          recurrence.isNotEmpty) {
                        setState(() {
                          titleController.text = '';
                          contentController.text = '';
                          deadlineController.text = '';
                          priorityController.text = '';
                          categoryController.text = '';
                          recurrenceController.text = '';
                          tasks[selectedIndex].title = title;
                          tasks[selectedIndex].content = content;
                          tasks[selectedIndex].deadline = deadline;
                          tasks[selectedIndex].priority = priority;
                          tasks[selectedIndex].category = category;
                          tasks[selectedIndex].recurrence = recurrence;
                          selectedIndex = -1;
                        });
                      }
                    },
                    child: const Text('Update'))
              ],
            ),
            const SizedBox(height: 10),
            tasks.isEmpty
                ? const Text("No tasks yet", style: TextStyle(fontSize: 22))
                : Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tasks[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(tasks[index].content),
            Text(tasks[index].deadline),
            Text(tasks[index].priority),
            Text(tasks[index].category),
            Text(tasks[index].recurrence),
          ],
        ),
        trailing: SizedBox(
          width: 90,
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    titleController.text = tasks[index].title;
                    contentController.text = tasks[index].content;
                    deadlineController.text = tasks[index].deadline;
                    priorityController.text = tasks[index].priority;
                    categoryController.text = tasks[index].category;
                    recurrenceController.text = tasks[index].recurrence;
                    setState(() {
                      selectedIndex = index;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item successfully updated'),
                      ),
                    );
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                onTap: () {
                  setState(() {
                    tasks.removeAt(index);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Item successfully deleted'),
                    ),
                  );
                },
                child: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
