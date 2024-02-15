import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs";

// 08/MAR/2021

export default class extends Controller {
  static targets = ["field", "value", "state", "switchOn", "switchOff"]
  static values = {url: String, field: String, refresh: Boolean}

  connect() {
    console.log('Filters: Connected')

    this.url = this.data.get('url')
  }

  clear() {
    let that = this

    console.log('key pressed')
    console.log('Path: ' + this.urlValue + '?field=' + this.fieldValue + '&by=' + this.valueTarget.value)

    Rails.ajax({
      type: 'GET',
      url: this.urlValue + '?field=' + this.fieldValue + '&by=',
      dataType: 'json',
      success: function (response) {
        that.valueTarget.value = ""
        that.valueTarget.classList.remove('border-info')
        that.stateTarget.classList.remove('border-info')
        $('#table-body').replaceWith(response.html)
      },
      error: function (response) {
        console.log('filter failed')
      }
    })
  }

  filterChanged() {
    let that = this
    console.log('key pressed')
    console.log('Path: ' + this.urlValue + '?field=' + this.fieldValue + '&by=' + this.valueTarget.value)

    Rails.ajax({
      type: 'GET',
      url: this.urlValue + '?field=' + this.fieldValue + '&by=' + this.valueTarget.value,
      dataType: 'turbo_stream',
      success: function (response) {
        that.valueTarget.classList.add('border-info')
        that.stateTarget.classList.add('border-info')
        $('#table-body').replaceWith(response.html)
        $('#product-paginate').replaceWith(response.paginate)
      },
      error: function (response) {
        console.log('filter failed')
      }
    })

  }

  inputChanged(e) {
    let that = this

    if (this.filterTimer) {
      clearTimeout(this.filterTimer)
    }

    this.filterTimer = setTimeout(
        function () {

          if (that.refreshValue === true) {
            this.url = that.urlValue + '?field=' + that.fieldValue + '&by=' + that.valueTarget.value + '&refresh=' + that.refreshValue
          } else {
            this.url = that.urlValue + '?field=' + that.fieldValue + '&by=' + that.valueTarget.value
          }


          fetch(this.url, {
            headers: {
              Accept: "text/vnd.turbo-stream.html"
            }
          })
              .then(r => r.text())
              .then(html => Turbo.renderStreamMessage(html))
        }, 200);
  }

  toggleOn(event) {
    let that = this
    console.log('key pressed')
    console.log('Path: ' + this.urlValue + '?field=' + this.fieldValue + '&by=' + event.target.value)

    let url = this.urlValue + '?field=' + this.fieldValue + '&by=1'

    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: function (response) {
        that.switchOffTarget.hidden = true
        that.switchOnTarget.hidden = false
        $('#table-body').replaceWith(response.html)
        $('#product-paginate').replaceWith(response.paginate)
      },
      error: function (response) {
        console.log('filter failed')
      }
    })

  }

  toggleOff(event) {
    let that = this
    let url = this.urlValue + '?field=' + this.fieldValue + '&by=0'

    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: function (response) {
        that.switchOffTarget.hidden = false
        that.switchOnTarget.hidden  = true
        $('#table-body').replaceWith(response.html)
        $('#product-paginate').replaceWith(response.paginate)
      },
      error: function (response) {
        console.log('filter failed')
      }
    })

  }


  startFilterTimer(url) {
    let that = this

    if (this.filterTimer) {
      clearTimeout(this.filterTimer)
    }

    this.filterTimer = setTimeout(
        function () {
          Rails.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            success: function (response) {
              that.contentTarget.innerHTML = response.html
              that.paginationTargets.forEach(function (element, index) {
                element.innerHTML = response.pagination
              });
            },
            error: function (response) {
              console.log('filter failed')
            }
          })
        }, 500);
  }

}