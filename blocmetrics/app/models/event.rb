class Event < ActiveRecord::Base
	belongs_to :tracked_app	

	def visits
		ips = Event.all.collect { |a| a.ip_address }.uniq
		visits = []

		ips.each do |v|
			visits[v] = Event.where(ip_address: ips[v]).count
			visits
		end
	end

end
