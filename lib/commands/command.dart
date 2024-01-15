abstract class Command {
  const Command();

  String get name;

  String get description;

  Future<void> execute();
}
