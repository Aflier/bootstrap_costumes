class Page < ApplicationRecord
  belongs_to :page, optional: true
  has_many :pages

  def self.top_pages
    pages__top = []

    Page.all.each do |page|
      pages__top << { id: page.name.parameterize, name: page.name, body: "Content for #{page.name}" }
    end

    puts ">>> #{pages__top}"

    pages__top
  end

  def children_tabs
    pages__top = []

    self.pages.each do |page|
      pages__top << { id: page.name.parameterize, name: page.name, body: "Content for #{page.name}" }
    end

    puts ">>> #{pages__top}"

    pages__top
  end

end
