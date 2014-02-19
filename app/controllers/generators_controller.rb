class GeneratorsController < ApplicationController
  helper_method :paragraphs

  def show
    @generator = Generator.find(params[:id])
    @lorem_ipsum = @generator.lorem_ipsums.build
    @ipsums = @generator.lorem_ipsums
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
    end
  end

  def paragraphs(n)
    output = ""
    n.to_i.times do
      output.concat("<p>#{random_ipsum}</p>")
    end
    output
  end

  def ipsums
  end

  private

  def random_ipsum
    paragraph = ""
    rand(AVG_PARAGRAPH).times do
      paragraph.concat @ipsums[rand(ipsums_count)].content
    end
    paragraph
  end

  AVG_PARAGRAPH = 10

  def ipsums_count
    @ipsums.count
  end

  def generator_params
    binding.pry
    params.require(:generator).permit(:name, :tagline, :sub_tagline, :logo, :image, :bg_image)
  end
end