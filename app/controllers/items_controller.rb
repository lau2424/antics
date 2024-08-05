require 'json'

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :load_json_options, only: %i[new edit]

  # GET /items or /items.json
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).limit(12)
  end

  # GET /items/1 or /items/1.json
  def show
    @user = @item.user
    @user_items = @user.items
  end

  def myitems
    @user_items = current_user.items
    @item = @user_items.first
  end

  def mypage
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.user = current_user
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user  # Ensure the current user is set as the item's user

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @q = Item.search(params[:q])
    @items = @q.result(distinct: true)
    render :index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :price, :content, :category, :width, :length, :century, :style, :height, :depth, :status, :matter)
  end

  # Load options from JSON file
  def load_json_options
    cat_file = Rails.root.join('app/assets/cat.json')
    if File.exist?(cat_file)
      cat = JSON.parse(File.read(cat_file))
      @style = cat['style'] || []
      @century = cat['century'] || []
      @category = cat['category'] || []
      @status = cat['status'] || []
      @matter = cat['matter'] || []
      Rails.logger.debug "Loaded JSON options: #{@category.inspect}, #{@style.inspect}, #{@century.inspect}, #{@status.inspect}, #{@matter.inspect}"
    else
      @style = []
      @century = []
      @category = []
      @status = []
      @matter = []
      Rails.logger.debug "JSON file not found. Using default empty arrays for options."
    end
  end
end
