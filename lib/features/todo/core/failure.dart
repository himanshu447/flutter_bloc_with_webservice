abstract class Failure {}

class Error extends Failure {
  final String error;

  Error({
    this.error,
  });
}
