// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import PasswordConfirmation from "../utilities/password_confirmation/pass_conf_class"
import SortingTable from "../utilities/sorting/sorting_class"
import FormHandler from "../utilities/form_inline/form_inline_class"

window.PasswordConfirmation = PasswordConfirmation
window.SortingTable = SortingTable
window.FormHandler = FormHandler

require("../utilities/sorting/sorting")
require("../utilities/password_confirmation/password_confirmation")
require("../utilities/form_inline/form_inline")
require("../utilities/progress_bar")

Rails.start()
Turbolinks.start()
ActiveStorage.start()
