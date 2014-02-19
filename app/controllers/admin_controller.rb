class AdminController < ApplicationController

  def index
    @ipsums = Generator.find(params[:generator_id]).lorem_ipsums
  end
end