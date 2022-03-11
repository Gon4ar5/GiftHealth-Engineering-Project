require './app/services/main'
require './app/services/parser'
require './app/presenters/console_presenter'
require 'pry'

Main.start(ARGV[0])
