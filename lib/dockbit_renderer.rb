require 'middleman-core/renderers/redcarpet.rb'

class DockbitRenderer < Middleman::Renderers::MiddlemanRedcarpetHTML
  def image(link, title, alt_text)
    scope.content_tag :div,
                      scope.image_tag(link, title: title,
                                            alt: alt_text,
                                            'data-rjs' => 3),
                      class: 'image'
  end
end
