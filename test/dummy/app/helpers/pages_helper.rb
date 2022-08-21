module PagesHelper

  def pages__options(page)
    if page.page
      return { breadcrumbs: [{ name: page.page.name, path: page_path(page.page) }] }
    else
      return { breadcrumbs: [{ name: 'Top', path: pages_path }] }
    end
  end

end
