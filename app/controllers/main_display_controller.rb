class MainDisplayController < ApplicationController
	def index
		@centrals = Central.all
	end
end