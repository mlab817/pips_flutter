class LoginRequest {
  String username;
  String password;

  LoginRequest(this.username, this.password);
}

class ForgotPasswordRequest {
  String email;

  ForgotPasswordRequest(this.email);
}