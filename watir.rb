require 'rubygems'
require 'watir-webdriver'
require 'headless'

headless = Headless.new
headless.start
browser = Watir::Browser.new

(072401..072401).each do |i|
	s = i.to_s.rjust(6, '0')

	browser.goto "https://secure.fitness.org.au/fit-wrap/workflows/COMPANY.DIRECTORY.VIEW?dbWorkflowKey=#{s}"
	
	el = browser.element :css => '.output'
	puts el.inspect

end

browser.close
headless.destroy