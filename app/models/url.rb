class Url < ActiveRecord::Base
	validates :long_url, :short_url, presence: true
	validates :long_url, format:{with:(URI::regexp(['http', 'https']))}
	validates :long_url, uniqueness:{case_sensitive: false, message: "Bad link!"}


	def self.reterive_short_url(proper_long_url)
		@url = Url.find_by(long_url: proper_long_url)
		if @url.nil?
			return nil
		else
			@url.short_url
		end
	end

	def shorten
		self.short_url = SecureRandom.hex(6)
	end
end
