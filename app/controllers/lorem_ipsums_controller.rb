class LoremIpsumsController < ApplicationController

  def create
    @lorem_ipsum = LoremIpsum.create(lorem_ipsums_params)
    redirect_to Generator.find_by(id: lorem_ipsums_params[:generator_id])
  end

  private

    def lorem_ipsums_params
      params.require(:lorem_ipsum).permit(:content, :generator_id)
    end
end