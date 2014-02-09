class Store < ActiveRecord::Base

	def self.update_tips
		@store = Store.first
		response = Faraday.get 'https://blockchain.info/q/addressbalance/1HAomFh557tvDnNGfJNkybS3fbTrxbmJQd?confirmations=0'
    	@store.coffee = (response.body.to_d * 0.00000700).floor.to_i
    	@store.save
	end
end
