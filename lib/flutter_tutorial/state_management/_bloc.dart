/**
 * What is Bloc (Business Logic componets)?
 * 
 * Bloc is a brigde between UI and logical layers, I will:
 *    + listen an event from UI
 *    + perform logicaly business in bloc 
 *    + Return new state for rerender UI
 * 
 * libraries for Bloc : 
 *  
 * dependencies:
 *  flutter_bloc: ^8.1.3
 *  equatable: ^2.0.5
 *
 * 
 *  3 step to create a bloc
 *    1. create envents
 *    2. create state
 *    3. create bloc
 * 
 *  bloc usage in widget
 *    1. use BlocProvider 
 *    2. 
 */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// 1. EVENT
abstract class CounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DecrementEvent extends CounterEvent {}

class IncrementEvent extends CounterEvent {}

/// 2. STATE
class CounterState extends Equatable {
  final int counter;

  CounterState({required this.counter});

  @override
  List<Object> get props => [counter];
}

/// 3. BLOC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });
    on<DecrementEvent>((event, emit) {
      if (state.counter > 0) {
        emit(CounterState(counter: state.counter - 1));
      }
    });
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: const CounterPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Bloc Counter Event Example")),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder:
                (context, state) => Row(
                  children: [
                    Text(
                      'Counter : ${state.counter}',
                      style: const TextStyle(fontSize: 30),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        counterBloc.add(DecrementEvent());
                      },
                    ),
                  ],
                ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterBloc.add(IncrementEvent());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
