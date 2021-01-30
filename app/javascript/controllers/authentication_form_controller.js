import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["passwordField"]
  togglePasswordVisibility() {
    let x = this.passwordFieldTarget;
    if (x.type === "password") {
       x.type = "text";
     } else {
       x.type = "password";
     }
  }
}
