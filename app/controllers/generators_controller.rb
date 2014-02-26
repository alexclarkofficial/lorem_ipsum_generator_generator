class GeneratorsController < ApplicationController
before_filter :authenticate_user!, except: :show
  helper_method :paragraphs

  def show
    @generator = Generator.find(params[:id])
    @lorem_ipsum = @generator.lorem_ipsums.build
    @ipsums = @generator.lorem_ipsums.approved_scope
  end

  def new
    @generator = Generator.new
  end

  def create
    @generator = Generator.new(generator_params)
    if @generator.save
      redirect_to @generator
    else
      render 'new'
      flash[:error] = "Name taken!"
    end
  end

  def paragraphs(n)
    output = ""
    n.to_i.times do
      output.concat("<p>#{random_ipsum}</p>")
    end
    output
  end

  def edit
    @generator = Generator.find(params[:id])
  end

  def update
    @generator = Generator.find(params[:id])
    if @generator.update(generator_params)
      redirect_to :back
      flash[:success] = "Generator updated"
    else
      flash[:error] = "Update Failed"
    end
  end

  private

  def random_ipsum
    paragraph = ""
    (rand(AVG_PARAGRAPH) + 1).times do
      paragraph.concat @ipsums[rand(ipsums_count)].content + " "
    end
    paragraph
  end

  AVG_PARAGRAPH = 10

  def ipsums_count
    @ipsums.count
  end

  def generator_params
    params.require(:generator).permit(:name, :tagline, :sub_tagline, :logo, :image, :bg_image)
  end
end