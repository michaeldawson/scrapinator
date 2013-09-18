class Result < ActiveRecord::Base
	def self.to_csv(offset=0, size=1000)
		puts "about to generate based on #{size} size and #{offset} offset"
		CSV.generate() do |csv|
			csv << column_names
			offset(offset).first(size).each do |result|
				csv << result.attributes.values_at(*column_names)
			end
		end
	end
end
