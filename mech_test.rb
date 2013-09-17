require 'rubygems'


require 'open-uri'
  require 'mechanize'
  agent = WWW::Mechanize.new
  
  agent.get("https://secure.fitness.org.au/fit-wrap/workflows/COMPANY.DIRECTORY.VIEW?dbWorkflowKey=072401")
