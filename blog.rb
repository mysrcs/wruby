require 'kramdown'
require 'fileutils'
require 'date'
require 'rss'

# Define all the things
site_url = 'https://bt.srht.site'
site_name = 'btxx.org'
author_name = 'Bradley Taunt'

posts_dir = 'posts'
pages_dir = 'pages'
wiki_dir = 'pages/wiki'
recipes_dir = 'pages/recipes'
public_dir = 'public'

output_dir = 'build'
posts_output_dir = "#{output_dir}/posts"
pages_output_dir = "#{output_dir}/"
wiki_output_dir = "#{output_dir}/wiki/"
recipes_output_dir = "#{output_dir}/recipes/"

header_file = 'header.html'
footer_file = 'footer.html'
root_index_file = 'index.md'
rss_file = "#{output_dir}/rss.xml"

# Make sure output directories exist
FileUtils.mkdir_p(posts_output_dir)
FileUtils.mkdir_p(pages_output_dir)
FileUtils.mkdir_p(wiki_output_dir)
FileUtils.mkdir_p(recipes_output_dir)

# Read footer
footer_content = File.read(footer_file)

# Initialize an array to hold post and page data
posts = []
pages = []
wiki = []
recipes = []

# Replace title placeholder
def replace_title_placeholder(header_content, title)
  header_content.gsub('<title>{{TITLE}}</title>', "<title>#{title}</title>")
end

# Grab title from the first line of a Markdown file
def extract_title_from_md(lines)
  first_line = lines[0]
  if first_line && first_line.start_with?('# ')
    title = first_line[2..-1].strip
  else
    title = 'Blog Index'
  end
  title
end

# Process Markdown files
def process_markdown_files(input_directory, output_directory, content_array, header_file, footer_content)
  Dir.glob("#{input_directory}/*.md").each do |md_file|
    # Read the content of the Markdown file
    md_content = File.read(md_file)
    lines = md_content.lines

    # Grab title from the first line
    title = extract_title_from_md(lines)

    # Grab date from the third line
    third_line = lines[2]
    if third_line
      date = Date.parse(third_line.strip) rescue Date.today
    else
      date = Date.today
    end

    # Convert markdown to HTML
    html_content = Kramdown::Document.new(md_content).to_html

    # Create output directory and file name
    file_name = File.basename(md_file, '.md')
    item_dir = "#{output_directory}/#{file_name}"
    output_file = "#{item_dir}/index.html"

    # Make sure item directory exists
    FileUtils.mkdir_p(item_dir)

    # Read and replace title in header content
    header_content = replace_title_placeholder(File.read(header_file), title)

    # Write to output file and add header and footer templates
    File.open(output_file, 'w') do |file|
      file.write(header_content)
      file.write(html_content)
      file.write(footer_content)
    end

    # Add item information to the array
    content_array << { title: title, date: date, link: "#{output_directory.split('/').last}/#{file_name}/", content: html_content }
  end
end

# Process markdown files in posts and pages directories
process_markdown_files(posts_dir, posts_output_dir, posts, header_file, footer_content)
process_markdown_files(pages_dir, pages_output_dir, pages, header_file, footer_content)
process_markdown_files(wiki_dir, wiki_output_dir, wiki, header_file, footer_content)
process_markdown_files(recipes_dir, recipes_output_dir, recipes, header_file, footer_content)

# Sort posts by date from newest to oldest
posts.sort_by! { |post| -post[:date].to_time.to_i }

# Read the root index.md file
root_index_content = File.read(root_index_file)
root_index_lines = root_index_content.lines

# Grab title from root index.md
root_title = extract_title_from_md(root_index_lines)

# Convert root index.md to HTML
root_index_html = Kramdown::Document.new(root_index_content).to_html

# Read and replace title in header content for the root index
header_content = replace_title_placeholder(File.read(header_file), root_title)

# Build out index content with header and root index content
index_content = header_content
index_content << root_index_html
index_content << "<ul class=\"posts\">\n"

# Add posts to root index
posts.each do |post|
  index_content << "<li><span>#{post[:date]}</span><a href='#{post[:link]}'>#{post[:title]}</a></li>\n"
end

# Finalize index content with footer
index_content << "</ul>\n"
index_content << footer_content

# Copy the public directory to the build directory
FileUtils.cp_r("#{public_dir}", output_dir)

# Write the index file
File.open("#{output_dir}/index.html", 'w') do |file|
  file.write(index_content)
end

# Generate RSS feed
rss = RSS::Maker.make("atom") do |maker|
  maker.channel.author = "#{author_name}"
  maker.channel.updated = Time.now.to_s
  maker.channel.about = "#{site_name}"
  maker.channel.title = "#{site_name} RSS Feed"

  posts.each do |post|
    maker.items.new_item do |item|
      item.link = "#{site_url}/#{post[:link]}"
      item.title = post[:title]
      item.updated = post[:date].to_s
      item.content.type = 'html'
      item.content.content = post[:content]
    end
  end
end

# Write RSS file
File.open(rss_file, 'w') do |file|
  file.write(rss)
end

puts "Blog built successfully in '#{output_dir}' folder. Have a great day!"
