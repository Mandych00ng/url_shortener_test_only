class UrlsController < ApplicationController

	def index
		render :index => true, :status => 200
	end 

	def create
		@url = Url.new(url_params)
		@url.shorten
		if @url.save
			redirect_to urls_path
		else
			@errors = "no url"
			redirect_to urls_path
		end
	end

	private

	def url_params
		params.require(:url).permit(:long_url)
	end
end
