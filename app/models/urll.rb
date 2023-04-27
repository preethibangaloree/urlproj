class Urll < ApplicationRecord
    before_create :generate_short_url, :sanitize
    def generate_short_url
        rand(36**8).to_s(36)
    end
    def sanitize
        long_url.strip!
        sanitize_url = self.long_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
        san_url =  "http://#{sanitize_url}"
    end
end
