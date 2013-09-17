desc "fetch gym data"

namespace :get_data do
	task :fetch => :environment do
	require 'open-uri'
		(72333..72401).each do |i|
			s = i.to_s.rjust(6, '0')

			puts "entry #{s}"

			doc = Nokogiri::HTML(open("https://secure.fitness.org.au/fit-wrap/workflows/COMPANY.DIRECTORY.VIEW?dbWorkflowKey=#{s}"))

			results = doc.css(".output")

			#legend = [:business_name, :street_address, :postcode, :region, :business_phone, :business_email, :website]

			result = Result.new

			if !results[0].text.empty?
				result.key = i
				result.business_name = results[0].text.gsub(/[^0-9a-z ]/i, '')
				result.street_address = results[1].text.gsub(/[^0-9a-z ]/i, '')
				result.postcode = results[2].text.gsub(/[^0-9a-z ]/i, '')
				result.region = results[3].text.gsub(/[^0-9a-z ]/i, '')
				result.business_phone = results[4].text.gsub(/[^0-9a-z ]/i, '')
				result.business_email = results[5].text
				result.website = results[6].text
				puts result.save
			else
				puts "false"
			end

			# street = doc.at_css(".output")
			#ext-gen36

			# puts result
			#puts street.text

		end
	end
end