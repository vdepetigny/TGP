class StaticPagesController < ApplicationController
  
  def team
  end

  def contact
  end

  def welcome
  	@first_name = params["id"]
  end
end
