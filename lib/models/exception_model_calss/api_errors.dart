class ApiErrors {
  String getErrorMessageFromException({required RunTimeTypeExceptions e}) {
    switch (e) {
      case RunTimeTypeExceptions.socketException:
        return "Cannot proceed with the request, kindly check your internet";
      case RunTimeTypeExceptions.timeOutException:
        return 'The request took too long to complete. Please try again later.';
      default:
        return 'An error occurred while fetching data. Please try again later.';
    }
  }
}

ApiErrors apiErrors = ApiErrors();

enum RunTimeTypeExceptions {
  socketException,
  timeOutException,
  unKnownException
}
