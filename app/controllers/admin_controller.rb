class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @ipsums = LoremIpsum.where(generator_id: params[:generator_id])
  end
end