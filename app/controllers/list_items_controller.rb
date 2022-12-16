class ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

  ITEM_PER_PAGE = 3

  # GET /items or /items.json
  def index
    @list_items = ListItem.all
    if params[:query]
      @query = params[:query]
      @list_items = @list_items.where('last_name LIKE ?', "%#{@query}%")
    end
    @page = params.fetch(:page, 0).to_i
    @total_pages = (@list_items.length * 1.0 / ITEM_PER_PAGE).ceil
    @list_items = @list_items.offset(@page * ITEM_PER_PAGE).limit(ITEM_PER_PAGE)
    respond_to do |format|
      format.html
      format.json { render json: @list_items }
    end
  end
  # GET /list_items or /list_items.json
  def index
    @list_items = ListItem.order(sort_column + " " + sort_direction)
  end

  # GET /list_items/1 or /list_items/1.json
  def show
  end

  # GET /list_items/new
  def new
    @list_item = ListItem.new
  end

  # GET /list_items/1/edit
  def edit
  end

  # POST /list_items or /list_items.json
  def create
    @list_item = ListItem.new(list_item_params)
    respond_to do |format|
      if @list_item.save
        format.html { redirect_to list_item_url(@list_item), notice: "List item was successfully created." }
        format.json { render :show, status: :created, location: @list_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_items/1 or /list_items/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
        format.html { redirect_to list_item_url(@list_item), notice: "List item was successfully updated." }
        format.json { render :show, status: :ok, location: @list_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1 or /list_items/1.json
  def destroy
    @list_item.destroy

    respond_to do |format|
      format.html { redirect_to list_items_url, notice: "List item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.require(:list_item).permit(:first_name, :last_name, :email, :phone, :class_name)
    end

    def sort_column
      ListItem.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
end
