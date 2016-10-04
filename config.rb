require 'lib/dockbit_renderer'

# Extensions
activate :directory_indexes
activate :syntax
activate :breadcrumbs

activate :search do |search|
  search.resources = [
    'chats/',
    'vcs/',
    'integrations/',
    'security/',
    'getting-started/',
    'how-to/',
    'using-dockbit/'
  ]
  search.fields = {
    title: { boost: 100, store: true, required: true },
    url: { index: false, store: true }
  }
end

# Assets paths
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Markdown settings
set :markdown_engine, :redcarpet
set :markdown, renderer: DockbitRenderer.new(with_toc_data: true),
               fenced_code_blocks: true,
               gh_blockcode: true,
               strikethrough: true,
               no_intra_emphasis: true,
               space_after_headers: true,
               tables: true

# htmlproofer needs it
activate :relative_assets
set :relative_links, true

# Assets building
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :autoprefixer
  # FIXME: Disable until https://github.com/middleman/middleman/issues/1991 fixed
  # activate :asset_hash
end

configure :development do
  activate :livereload
end
