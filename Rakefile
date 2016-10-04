require 'html-proofer'

task :test do
  HTMLProofer.check_directory('./build', {
    directory_index_file: 'index.html',
    disable_external: true,
    url_ignore: [/linkedin.com/],
    verbose: true
  }).run
end
