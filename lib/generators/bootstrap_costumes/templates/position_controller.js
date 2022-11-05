import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { put, get, post, patch, destroy } from "@rails/request.js"

//  <tbody data-controller="position"
//         data-position-path-value="<%= position_something_path %>">
//    <% @somethings.order(:position).each do |something| %>
//      <%= content_tag :tr, data: { sgid: something.to_sgid_param } do %>
//        <td><%= something.name %></td>
//      <% end %>
//    <% end %>
//  </tbody>

//  include BootstrapCostumes::PositionControl

//   resources :somethings do
//     collection do
//       put :position
//     end
//   end

export default class extends Controller {

  static values = { path: String }

  connect() {
    console.log(`Position#connect ` + this.pathValue)

    this.sortable = Sortable.create(this.element, {
      animation: 150,
      onEnd: this.updatePosition.bind(this)
    })
  }

  async updatePosition(event) {
    const response = await put(this.pathValue, {
      body: JSON.stringify({
        sgid: event.item.dataset.sgid,
        position: event.newIndex + 1
      })
    })
    if (response.ok) {
      console.log(event.item.dataset.sgid)
    }
  }
}
