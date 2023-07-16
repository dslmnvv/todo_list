import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:todo_list/src/presentation/pages/appbar/light_app_bar.dart';
import 'package:todo_list/src/presentation/providers/add_task_provider.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';
import 'package:todo_list/src/routing/navigation_service.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../_common/log_handler.dart';
import '../../data/api/device/device_info.dart';
import '../style/theme/app_theme_extension.dart';

class TaskArgs {
  final Task? task;
  final int? index;

  TaskArgs(this.task, this.index);
}

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({
    Key? key,
    this.task,
  }) : super(key: key);

  static const routeName = 'add_task_page';
  final Task? task;

  @override
  Widget build(BuildContext context) {
    Log.d('AddTaskPage: task = $task');

    return ChangeNotifierProvider(
        create: (context) => AddTaskProvider(task ??
            Task.empty(
              id: const Uuid().v1(),
              deviceId: GetIt.instance<DeviceInfo>().id,
            )),
        child: Builder(
          builder: (context) {
            var state = context.watch<AddTaskProvider>();

            return Scaffold(
                appBar: LightAppBar(
                  left: IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: NavigationService.pop,
                    icon: Icon(Icons.clear,
                        color: Theme.of(context)
                            .extension<AppThemeExtension>()
                            ?.backButton),
                  ),
                  right: Material(
                    color: Colors.transparent,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                      ),
                      onPressed: (task != null)
                          ? () => state.change(task!)
                          : state.save,
                      child: Text(AppLocalizations.of(context)!.save),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: StyleLibrary.padding.body,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DescriptionField(
                          onChanged: state.onChanged,
                          initialValue: task?.text,
                        ),
                        StyleLibrary.padding.hBox,
                        PriorityContainer(
                          onSelect: state.selectPriority,
                          priority: task?.importance ?? Priority.basic,
                        ),
                        const Divider(),
                        StyleLibrary.padding.hBox,
                        DatePickerContainer(
                          onSelect: state.selectDate,
                          onSwitch: state.switchDate,
                          initialDate: task?.deadline,
                        ),
                        StyleLibrary.padding.hBox,
                        const Divider(),
                        DeleteButton(
                          onRemove: (task != null)
                              ? () => state.onRemove(task!)
                              : null,
                        ),
                        StyleLibrary.padding.hBox,
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}

class DescriptionField extends StatelessWidget {
  const DescriptionField(
      {Key? key, required this.onChanged, required this.initialValue})
      : super(key: key);

  final Function(String? value) onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: StyleLibrary.color.main.secondary,
      color: Colors.transparent,
      child: TextFormField(
          initialValue: initialValue,
          style: Theme.of(context).textTheme.bodyMedium,
          minLines: 5,
          maxLines: 15,
          onChanged: onChanged,
          decoration: StyleLibrary.input.main.copyWith(
            fillColor:
                Theme.of(context).extension<AppThemeExtension>()?.backSecondary,
            hintText: AppLocalizations.of(context)!.whatNeed,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color
                      ?.withOpacity(0.5),
                ),
          )),
    );
  }
}

class PriorityContainer extends StatefulWidget {
  const PriorityContainer(
      {Key? key, required this.onSelect, required this.priority})
      : super(key: key);

  final Function(Priority priority) onSelect;
  final Priority priority;

  @override
  State<PriorityContainer> createState() => _PriorityContainerState();
}

class _PriorityContainerState extends State<PriorityContainer> {
  Priority priority = Priority.basic;
  late List<String> items;
  //late String current;

  @override
  void initState() {
    super.initState();
    items = [];
    for (var element in Priority.values) {
      items.add(element.nameField);
    }
    priority = widget.priority;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.importance,
            style: Theme.of(context).textTheme.bodyMedium),
        StyleLibrary.padding.hBoxMini,
        DropdownButton(
          dropdownColor: Theme.of(context)
              .extension<AppThemeExtension>()
              ?.dropDownMenuColor,
          underline: const SizedBox(),
          icon: const SizedBox(),
          value: priority.nameField,
          items: items.map<DropdownMenuItem<String>>((String value) {
            var prior = Priority.fromNameField(value);

            switch (prior) {
              case Priority.important:
                {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Text(
                            '!!',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .extension<AppThemeExtension>()
                                      ?.red,
                                ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(value,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ));
                }
              case Priority.low:
                {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: Theme.of(context).textTheme.bodyMedium));
                }
              default:
                {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ));
                }
            }
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                priority = Priority.fromNameField(value);
              });
              widget.onSelect(priority);
            }
          },
        )
      ],
    );
  }
}

class DatePickerContainer extends StatefulWidget {
  const DatePickerContainer(
      {Key? key,
      required this.onSelect,
      required this.onSwitch,
      this.initialDate})
      : super(key: key);

  final Function(DateTime dateTime) onSelect;
  final Function(bool value) onSwitch;
  final DateTime? initialDate;

  @override
  State<DatePickerContainer> createState() => _DatePickerContainerState();
}

class _DatePickerContainerState extends State<DatePickerContainer> {
  bool useDate = false;
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      currentDate = widget.initialDate!;
      useDate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.makeUp,
                style: Theme.of(context).textTheme.bodyMedium),
            (useDate)
                ? TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      var now = DateTime.now();
                      showDatePicker(
                        locale: const Locale('ru'),
                        firstDate: now,
                        lastDate: DateTime(now.year + 99),
                        initialDate: DateTime.now(),
                        context: context,
                        builder: (context, child){
                          return Theme(
                              data: Theme.of(context).extension<AppThemeExtension>()!.datePickerTheme,
                              child: child!
                          );
                        }
                      ).then((value) {
                        if (value != null) {
                          widget.onSelect(value);
                          setState(() {
                            currentDate = value;
                          });
                        }
                      });
                    },
                    child: Text(StyleLibrary.format.main.format(currentDate)))
                : const SizedBox(),
          ],
        ),
        Switch(
            value: useDate,
            onChanged: (val) {
              setState(() {
                useDate = !useDate;
              });
              widget.onSwitch(useDate);
            })
      ],
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, required this.onRemove}) : super(key: key);

  final Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: (onRemove != null)
            ? TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor:
                    Theme.of(context).extension<AppThemeExtension>()?.red,
              )
            : TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor:
                    Theme.of(context).extension<AppThemeExtension>()?.icon,
                iconColor:
                    Theme.of(context).extension<AppThemeExtension>()?.icon,
              ),
        onPressed: onRemove,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.delete),
            const SizedBox(width: 10),
            Text(AppLocalizations.of(context)!.remove,
                style: StyleLibrary.font.button.copyWith(
                    color: (onRemove == null)
                        ? Theme.of(context).extension<AppThemeExtension>()?.icon
                        : Theme.of(context)
                            .extension<AppThemeExtension>()
                            ?.red)),
          ],
        ));
  }
}
