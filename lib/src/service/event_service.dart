import 'package:event_bus/event_bus.dart';

class EventService {
  static EventService get instance => _instance;
  factory EventService() => _instance;

  static final EventService _instance = EventService._();
  EventService._();

  late final eventBus = EventBus();
}
