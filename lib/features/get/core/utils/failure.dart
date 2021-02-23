abstract class Failure {}

class Error extends Failure{
	
	final String errorMessage;

  Error({this.errorMessage});
	
}