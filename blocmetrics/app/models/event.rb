class Event < ActiveRecord::Base
	belongs_to :tracked_app	

	def self.ips
		ips = Event.all.collect do |a| 
			a.ip_address.nil? ? 0 : a.ip_address
		end.uniq
	end

	def self.emails
		emails = Event.all.collect do |e| 
			e.property_2.nil? ? 0 : e.property_2.to_s
		end.uniq
	end

	def self.email_visits
		email_visits = []
		emails.each_with_index do |v, i|
			emails[i] == 0 ? email_visits << Event.where(property_2: nil).count : email_visits << Event.where(property_2: emails[i]).count
		end
		email_visits		
	end

	def self.email_count
		email_hash_array = []
		email_array = self.emails.zip(self.email_visits)
		email_array.each do |i|
			email_hash_array << { key: "#{i[0]}", value: "#{i[1]}" }
		end
		email_hash_array
	end

	def self.visits
		visits = []

		ips.each_with_index do |v, i|
			ips[i] == 0 ? visits << Event.where(ip_address: nil).count : visits << Event.where(ip_address: ips[i]).count
		end
		visits	
	end

	def self.visit_count
		visit_count = ips.zip(visits).to_h
	end

end
