#PubSub notification fior Android and iOS devices
#for detail please refer https://cloud.google.com/pubsub/reference/rest/v1/projects.topics/create#body.aspect
require 'json'
require 'curb'
module Pubsub

	class Notification
		attr_accessor :json_data

		def initialize(data)
			#data must be an hash object
			#example {data: {message: "testing one two three", image: "htp://example.com/xyz/abc.png"}}
			
			if data.nil? 
				raise "Data packet is missing."
			end
			@json_data = JSON.pretty_generate(data.merge(to: "/topics/#{PUBSUB_TOPIC}"))
		end

		def broadcast
			begin
				req = Curl::Easy.http_post("https://gcm-http.googleapis.com/gcm/send", @json_data) do |curl|
					curl.headers["Content-Type"] = "application/json"
					curl.headers["Authorization"] = "key=#{GCM_API_KEY}"
				end
			rescue Exception => e
				puts ("======================")
				puts  e.message
				#error log here
				raise e.message
			end
			#call below function if you need to log notification response 
			# record_notification_logs(req)

			return JSON.parse req.body_str
		end

		def record_notification_logs(req)
			#put your code here to record notification response
			puts  JSON.parse req.body_str
		end

	end
end

