class CityController < ApplicationController
  def index
  end

  def show
    @city = City.find(params[:id])
    @gossips = []
    @city.users.each do |u|
      u.gossips.each do |g|
        @gossips << g 
      end
    end  
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
