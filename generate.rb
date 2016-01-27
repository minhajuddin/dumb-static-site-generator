#!/usr/bin/env ruby

require 'fileutils'

# this generates a static site into a public folder for the current directory

# create the folder
FileUtils.mkdir_p "public"

# read the layout
layout = File.read("layout.html")


# read the pages
Dir["pages/*html"].each do |page_filepath|
  page = File.read(page_filepath)
  # replace the page title and page content
  title = File.basename(page_filepath) # we'll use the filename as the title
  rendered_page = layout.gsub("_PAGE_TITLE", title)
  rendered_page = rendered_page.gsub("_PAGE_CONTENT", page)

  # write it out
  File.write("public/#{title}", rendered_page)
  puts "generated #{title}"
end

puts "DONE"
