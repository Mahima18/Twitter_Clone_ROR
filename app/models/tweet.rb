class Tweet < ApplicationRecord
	belongs_to :user
	validates_length_of :body, :maximum => 170
	validates_presence_of :title, :body
end
