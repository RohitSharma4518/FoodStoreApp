String getFirebaseErrorMessage(String code) {
  switch (code) {
    case "user-not-found":
      return "User doesn't exist.";
    case "email-already-in-use":
      return 'Email already exists';
    case "invalid-credential":
      return 'Invalid Credential';
    case "invalid-email":
      return 'Invalid Email';
    case "wrong-password":
      return 'Incorrect Password';
    case "too-many-requests":
      return "You've exceeded the limit. Try again later.";
    default:
      return 'Something went wrong. Please try again.';
  }
}
