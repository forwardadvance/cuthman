class Admin::WidgetsController < ApplicationController
  before_action :set_widget, only: [:edit, :update, :destroy]
  before_action :get_resources, only: [:new, :create]

  # GET /widgets/new
  def new
    @widget = Widget.new page_id: params[:page], slot: params[:slot]
    session[:page_id] = @widget.page.id
  end

  # GET /widgets/1/edit
  def edit
  end

  # POST /widgets
  # POST /widgets.json
  def create
    @widget = Widget.new(widget_params)
    respond_to do |format|
      if @widget.save
        format.html { redirect_to last_edited_page_path, notice: 'Widget was successfully created.' }
        format.json { render action: 'show', status: :created, location: @widget }
      else
        format.html { render action: 'new' }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /widgets/1
  # PATCH/PUT /widgets/1.json
  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to last_edited_page_path, notice: 'Widget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
    @widget.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      @widget = Widget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def widget_params
      params.require(:widget).permit(:page_id, :slot, :resource_id, :resource_type)
    end

    def get_resources

      @news = News.all
      @maps = Map.all
      @articles = Article.all
      @images = Image.all
    end
end
