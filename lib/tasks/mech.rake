desc "Scrape data"
task :mech => :environment do
	# require 'rubygems'
	# require 'mechanize'

	# a = Mechanize.new { |agent|
	#   agent.user_agent_alias = 'Mac Safari'
	# }


	# (072401..072401).each do |i|
	# 	s = i.to_s.rjust(6, '0')

	# 	a.get('https://secure.fitness.org.au/fit-wrap/workflows/COMPANY.DIRECTORY.VIEW?dbWorkflowKey=072402') do |page|
	# 	  search_result = page.form_with(:name => 'COMPANY.DIRECTORY.VIEW') do |search|
	# 	    search.dbWorkflowKey = s
	# 		search.currentPage = 'COMPANY.DIRECTORY.DETAILS__FIT'
	# 		search.dbWorkflowSession = 'CMS_CACHE_16697_43517_8_874078'
	# 		search.atrestId = 'COMPANY.DIRECTORY.VIEW'
	# 		search.submit_cms_action = ''
	# 		search.targetClient = 'wrap'
	# 		search.siteId = ''
	# 		search.wrapper = 'default'

	# 	  end.submit

	# 	  # search_result.links.each do |link|
	# 	  #   puts link.text
	# 	  # end

	# 	  puts search_result.inspect
	# 	end
	# end


	require "rubygems"
	require "bundler/setup"
	require "capybara"
	require "capybara/dsl"
	require "capybara-webkit"
	Capybara.run_server = false
	Capybara.current_driver = :webkit
	Capybara.app_host = "http://www.google.com/"

	module Test
	  class Google
	    include Capybara::DSL
	    
	    def get_results
	      visit('/')
	      fill_in "q", :with => "Capybara"
	      click_button "Google Search"
	      all(:xpath, "//li[@class='g']/h3/a").each { |a| puts a[:href] }

	    end
	  end
	end

	spider = Test::Google.new
	spider.get_results

end