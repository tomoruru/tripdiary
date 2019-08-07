class TripdiarysController < ApplicationController
  before_action :correct_user, only: [:destroy]
  
  def index
    @trips =  Trip.all
  end
end
