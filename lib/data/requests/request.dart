class LoginRequest {
  String username;
  String password;

  LoginRequest(this.username, this.password);
}

class ForgotPasswordRequest {
  String email;

  ForgotPasswordRequest(this.email);
}

class GetProjectsRequest {
  int page = 1;

  GetProjectsRequest(this.page);
}

class GetSearchProjectsRequest {
  String q = "";

  int page = 1;

  GetSearchProjectsRequest(this.q, this.page);
}