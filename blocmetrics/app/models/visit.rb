class Visit < ActiveRecord::Base
	has_many :topic_views
	has_many :bookmark_views
end
