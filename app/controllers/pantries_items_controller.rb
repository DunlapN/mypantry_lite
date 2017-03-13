class PantriesItemsController < ApplicationController
  before_action :current_user_must_be_pantries_item_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_pantries_item_user
    pantries_item = PantriesItem.find(params[:id])

    unless current_user == pantries_item.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = PantriesItem.ransack(params[:q])
    @pantries_items = @q.result(:distinct => true).includes(:user, :food).page(params[:page]).per(10)

    render("pantries_items/index.html.erb")
  end

  def show
    @pantries_item = PantriesItem.find(params[:id])

    render("pantries_items/show.html.erb")
  end

  def new
    @pantries_item = PantriesItem.new

    render("pantries_items/new.html.erb")
  end

  def create
    @pantries_item = PantriesItem.new

    @pantries_item.user_id = params[:user_id]
    @pantries_item.food_id = params[:food_id]

    save_status = @pantries_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pantries_items/new", "/create_pantries_item"
        redirect_to("/pantries_items")
      else
        redirect_back(:fallback_location => "/", :notice => "Pantries item created successfully.")
      end
    else
      render("pantries_items/new.html.erb")
    end
  end

  def edit
    @pantries_item = PantriesItem.find(params[:id])

    render("pantries_items/edit.html.erb")
  end

  def update
    @pantries_item = PantriesItem.find(params[:id])
    @pantries_item.food_id = params[:food_id]

    save_status = @pantries_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pantries_items/#{@pantries_item.id}/edit", "/update_pantries_item"
        redirect_to("/pantries_items/#{@pantries_item.id}", :notice => "Pantries item updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Pantries item updated successfully.")
      end
    else
      render("pantries_items/edit.html.erb")
    end
  end

  def destroy
    @pantries_item = PantriesItem.find(params[:id])

    @pantries_item.destroy

    if URI(request.referer).path == "/pantries_items/#{@pantries_item.id}"
      redirect_to("/", :notice => "Pantries item deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Pantries item deleted.")
    end
  end
end
