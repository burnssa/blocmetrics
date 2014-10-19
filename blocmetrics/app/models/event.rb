class Event < ActiveRecord::Base
	belongs_to :tracked_app	

	def self.ips
		ips = Event.all.collect do |a| 
			if a.ip_address.nil?
				0
			else
				a.ip_address
			end
		end.uniq
	end

	def self.emails
		emails = Event.all.collect { |a| a.property_2 }.uniq
	end

	def self.visits
		visits = []

		ips.each_with_index do |v, i|
			if ips[i] == 0
				visits << Event.where(ip_address: nil).count
			else 
				visits << Event.where(ip_address: ips[i]).count
			end
		end
		visits	
	end

	def self.visit_count
		visit_count = ips.zip(visits)
	end

end
