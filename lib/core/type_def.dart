import 'package:fpdart/fpdart.dart';
import 'package:helper/core/core.dart';

/// FutureEither takes two data types that is not dynamic and any other datatype
/// like string with the use of fpdart package

typedef FutureEither<T> = Future<Either<Failure, T>>; //? generic type
typedef FutureEitherVoid = FutureEither<void>; //? return void
typedef FutureVoid = Future<void>;

typedef MapString = Map<String, dynamic>;
typedef MapType<T> = Map<String, T>;
typedef ListOfString = List<String>;
typedef ListOfBool = List<bool>;
