class LoremIpsumsController < ApplicationController

  def create
    @lorem_ipsum = LoremIpsum.create(lorem_ipsums_params)
    redirect_to Generator.find_by(id: lorem_ipsums_params[:generator_id])
  end

  def destroy
    LoremIpsum.find(params[:id]).destroy
    flash[:success] = "Ipsum destroyed."
    redirect_to :back
  end

  def approve
    LoremIpsum.find(params[:id]).update(approved: true)
    redirect_to :back
  end

  private

    def lorem_ipsums_params
      params.require(:lorem_ipsum).permit(:content, :generator_id)
    end
end