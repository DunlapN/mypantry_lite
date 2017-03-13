class PantriesController < ApplicationController
  def index
    @q = Pantry.ransack(params[:q])
    @pantries = @q.result(:distinct => true).page(params[:page]).per(10)

    render("pantries/index.html.erb")
  end

  def show
    @pantry = Pantry.find(params[:id])

    render("pantries/show.html.erb")
  end

  def new
    @pantry = Pantry.new

    render("pantries/new.html.erb")
  end

  def create
    @pantry = Pantry.new

    @pantry.user_id = params[:user_id]
    @pantry.food_id = params[:food_id]

    save_status = @pantry.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pantries/new", "/create_pantry"
        redirect_to("/pantries")
      else
        redirect_back(:fallback_location => "/", :notice => "Pantry created successfully.")
      end
    else
      render("pantries/new.html.erb")
    end
  end

  def edit
    @pantry = Pantry.find(params[:id])

    render("pantries/edit.html.erb")
  end

  def update
    @pantry = Pantry.find(params[:id])

    @pantry.user_id = params[:user_id]
    @pantry.food_id = params[:food_id]

    save_status = @pantry.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pantries/#{@pantry.id}/edit", "/update_pantry"
        redirect_to("/pantries/#{@pantry.id}", :notice => "Pantry updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Pantry updated successfully.")
      end
    else
      render("pantries/edit.html.erb")
    end
  end

  def destroy
    @pantry = Pantry.find(params[:id])

    @pantry.destroy

    if URI(request.referer).path == "/pantries/#{@pantry.id}"
      redirect_to("/", :notice => "Pantry deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Pantry deleted.")
    end
  end
end
