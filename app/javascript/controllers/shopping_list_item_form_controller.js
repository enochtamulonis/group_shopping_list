import { Controller } from "stimulus"

export default class extends Controller {
  submitForm() {
    this.element.submit();
  }
}
