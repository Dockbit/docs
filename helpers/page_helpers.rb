require 'nokogiri'

module PageHelpers

  def topics(parent: nil)
    out = {}
    sitemap.resources.each do |resource|
      next unless resource.template?
      next if resource.page_id =~ /^errors\//

      # If parent resource provided, collect all pages under it
      if parent
        next if parent == resource ||
                parent.page_id.split('/').first != resource.page_id.split('/').first

      # Otherwise assume we're root and take only 2nd level pages
      else
        next unless resource.page_id.split('/').size == 2
      end

      out[resource.page_id] = {
        url: resource.url,
        title: resource.data.title,
        meta: resource.data.meta
      }
    end

    out.sort
  end

  def table_of_contents(resource)
    content = File.read(resource.source_file)
    toc_renderer = Redcarpet::Render::HTML_TOC.new(nesting_level: 3)
    markdown = Redcarpet::Markdown.new(toc_renderer)

    # Get rid of first child coming from the page meta
    # FIXME: Find a better way to handle it
    toc = Nokogiri::HTML(markdown.render(content))
    toc.search('li').first.remove
    toc.at('ul').to_html
  end
end
