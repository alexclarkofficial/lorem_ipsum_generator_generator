class AdminController < ApplicationController

  def index
    @ipsums = LoremIpsum.where(generator_id: params[:generator_id])
  end
end