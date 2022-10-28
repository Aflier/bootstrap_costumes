# BootstrapCostumes
Short description and motivation.

## Usage
Warning this is something we use internally and likely to dramatically changed. Once we think 
it is stable enough we will probably make it into a proper gem. If you like what we have feel
free to do with it what you want... just give us a shout out.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'bootstrap_costumes', git: 'https://github.com/Aflier/bootstrap_costumes.git'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install bootstrap_costumes
```

## Generators

```bash
$ rails generate bootstrap_costumes:install
```

## Getting Started

### Icons

Add to a helper so you have access to the icons used. This requires font awesome however
you can define your own.

```bash
include BootstrapCostumes::IconsHelper
```


### Tabbed Card

```bash
<%= render 'bootstrap_costumes/cards/tabbed_card', 
           tabs: [{ id: 'tab', name: 'Tab', body: render('tab')}],
           options: {
             legacy: true,
             breadcrumbs: [ { name: "Breadcrumb", path: something_path(something) }] },
             links: [ { name: 'Link', path: something_path(other) }] %>
```

Only use "legacy: true" if you are using version 4 of bootstrap.

### Alerts

```bash
<%= render 'bootstrap_costumes/alerts/alert__help' do %>HELP<% end %>
<%= render 'bootstrap_costumes/alerts/alert__info' do %>INFO<% end %>
<%= render 'bootstrap_costumes/alerts/alert__success' do %>SUCCESS<% end %>
<%= render 'bootstrap_costumes/alerts/alert__warning' do %>WARNING<% end %>
<%= render 'bootstrap_costumes/alerts/alert__danger' do %>DANGER<% end %>
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
