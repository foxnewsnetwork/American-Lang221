class BetasignupsController < ApplicationController
  def new
    @betasignup = Betasignups.new
  end
  
  def create
    @betasignup = Betasignups.new(params[:betasignups])

    if @betasignup.save 
      flash[:success] = "Sign Up Success!"
      redirect_to 'pages/finished'
    else 
      render 'new'
    end
  end

end
