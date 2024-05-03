import 'index.dart';

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
typedef MapType<T> = Map<String, T>;
typedef MapObject = Map<String, Object>;
typedef ListMapper<X> = Map<X, List<X>>;

typedef ListOfString = List<String>;
typedef ListOfBool = List<bool>;
typedef ListOfInt = List<int>;
typedef BoolList = List<bool>;
typedef StringList = List<String>;
typedef IntList = List<int>;
typedef ListType<T> = List<T>;
