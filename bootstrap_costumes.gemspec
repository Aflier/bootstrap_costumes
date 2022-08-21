require_relative "lib/bootstrap_costumes/version"

Gem::Specification.new do |spec|
  spec.name        = "bootstrap_costumes"
  spec.version     = BootstrapCostumes::VERSION
  spec.authors     = ["Simon Kiteley"]
  spec.email       = ["simon@aflier.com"]
  spec.homepage    = "https://aflier.com"
  spec.summary     = "Summary of BootstrapCostumes."
  spec.description = "Description of BootstrapCostumes."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://aflier.com"
  spec.metadata["changelog_uri"] = "https://aflier.com"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'rails', '>= 5.2.2'
end
