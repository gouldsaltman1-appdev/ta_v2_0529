class EquipmentController < ApplicationController
  before_action :current_user_must_be_equipment_owner, :only => [:edit, :update, :destroy]

  def current_user_must_be_equipment_owner
    equipment = Equipment.find(params[:id])

    unless current_user == equipment.owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Equipment.ransack(params[:q])
    @equipment = @q.result(:distinct => true).includes(:owner, :loans, :category).page(params[:page]).per(10)

    render("equipment/index.html.erb")
  end

  def show
    @loan = Loan.new
    @equipment = Equipment.find(params[:id])

    render("equipment/show.html.erb")
  end

  def new
    @equipment = Equipment.new

    render("equipment/new.html.erb")
  end

  def create
    @equipment = Equipment.new

    @equipment.title = params[:title]
    @equipment.description = params[:description]
    @equipment.image = params[:image]
    @equipment.owner_id = params[:owner_id]
    @equipment.category_id = params[:category_id]

    save_status = @equipment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/equipment/new", "/create_equipment"
        redirect_to("/equipment")
      else
        redirect_back(:fallback_location => "/", :notice => "Equipment created successfully.")
      end
    else
      render("equipment/new.html.erb")
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])

    render("equipment/edit.html.erb")
  end

  def update
    @equipment = Equipment.find(params[:id])

    @equipment.title = params[:title]
    @equipment.description = params[:description]
    @equipment.image = params[:image]
    @equipment.owner_id = params[:owner_id]
    @equipment.category_id = params[:category_id]

    save_status = @equipment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/equipment/#{@equipment.id}/edit", "/update_equipment"
        redirect_to("/equipment/#{@equipment.id}", :notice => "Equipment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Equipment updated successfully.")
      end
    else
      render("equipment/edit.html.erb")
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])

    @equipment.destroy

    if URI(request.referer).path == "/equipment/#{@equipment.id}"
      redirect_to("/", :notice => "Equipment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Equipment deleted.")
    end
  end
end
