class CtempsController < ApplicationController
  def new
  end
  
  def create
    if @ctemp.save
    else
      render 'new'
    end
  end
end
