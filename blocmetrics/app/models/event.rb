class Event < ActiveRecord::Base
	belongs_to :tracked_app	

	def self.ips
		ips = Event.all.collect { |a| a.ip_address }.uniq
		ips
	end

	def self.visits
		visits = []

		ips.each_with_index do |v, i|
			visits << Event.where(ip_address: ips[i]).count
		end
		visits
		# visit_count = ips.zip(visits)
	end
end
