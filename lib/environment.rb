require_relative "./donutz/version"
require_relative "./donutz/cli"
require_relative "./donutz/donut"
require_relative "./donutz/order"
require_relative "./donutz/scraper"
require_relative "./donutz/ascii"

require 'pry'
require 'nokogiri'
require 'open-uri'

module Donutz
  class Error < StandardError; end
  # Your code goes here...
end