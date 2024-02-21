import { Controller } from "@hotwired/stimulus";
import { post } from "@rails/request.js";

export default class extends Controller {
  static targets = ["input", "newTypeForm"]

  createType(event) {
    event.preventDefault()
    const name = this.newTypeFormTarget.querySelector("input").value

    // AJAX request to create a new ExerciseType
    post("/exercise_types", {
      body: JSON.stringify({ exercise_type: { name: name } }),
      responseType: "turbo-stream",
      contentType: "application/json",
      headers: { "X-CSRF-Token": document.querySelector("[name='csrf-token']").content },
    })
  }
}
