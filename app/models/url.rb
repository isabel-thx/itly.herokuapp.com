#require 'uri'

class Url < ActiveRecord::Base

	#validates :long_url, format: { with: URI.regexp }
	validates :long_url, presence: true
	#validates :long_url, uniqueness: { case_sensitive: false, message: "This url has been shortened before" }
	validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}

	# This is Sinatra! Remember to create a migration!
	def shorten
		range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    self.short_url = Array.new(7){range.sample}.join
    self.save
	end

	

end
