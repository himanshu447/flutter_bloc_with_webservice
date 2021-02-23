import 'package:dartz/dartz.dart';
import 'failure.dart';

abstract class UseCase<Type, Params> {
	Future<Either<Failure, Type>> call(Params params);
}

abstract class CreateTableCase<Type, Params> {
	Either<Failure, Type> call(Params params);
}

class NoParams {}
