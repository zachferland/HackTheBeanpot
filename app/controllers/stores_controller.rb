class StoresController < ApplicationController

	# GET /articles/new
  # GET /articles/new.json
  def new
    @store = store.new
  end

  def create 
    @store = store.new(store_params)

  end

  def article_params
    params.require(:store).permit(:coffee)
  end

end
