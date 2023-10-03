import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="reset-form"
export default class extends Controller {
  reset() {
    console.log('reset');
    this.element.reset();
  }
}
