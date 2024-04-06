import 'package:helper/core/core.dart';

import '../client/error_handler.dart';

/// FutureEither takes two generic data types that is not dynamic

/// ```dart
///FutureEither<Failure, Success> do() {
///  return null;
///}
/// ```

typedef FutureEither<F, S> = Future<Either<F, S>>;
typedef FutureEitherF<S> = Future<Either<Failure, S>>;
typedef FutureVoid = Future<void>;

typedef MapJson = Map<String, dynamic>;
typedef MapObject<T> = Map<String, T>;
typedef ListOfString = List<String>;
typedef ListOfBool = List<bool>;
typedef ListOfInt = List<int>;

