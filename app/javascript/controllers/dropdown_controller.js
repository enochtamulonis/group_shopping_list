import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["menu"]
  toggleDropdown(event) {
    event.preventDefault();
    this.menuTarget.classList.toggle("hidden");
  }

  signOutRedirect() {
    setTimeout(() => {
      window.location.replace("/");
    },400)
  }
}
