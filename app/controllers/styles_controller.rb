class StylesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @styles = Style.all
    end
  
    def show
      @style = Style.find(params[:id])
    end
  
    def new
      @style = Style.new
    end
  
    def create
      @style = Style.new(style_params)
      @style.user = current_user
      
      if @style.save
        redirect_to @style, notice: 'Запись успешно создана.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @style = Style.find(params[:id])
    end
  
    def update
      @style = Style.find(params[:id])
      
      if @style.update(style_params)
        redirect_to @style, notice: 'Запись успешно загружена.'
      else
        render :edit
      end
    end
  
    def destroy
      @style = Style.find(params[:id])
      @style.destroy
      
      redirect_to styles_url, notice: 'Запись успешно удалена.'
    end
  
    private
  
    def style_params
      params.require(:style).permit(:title, :picture, :description, :price, :location)
    end
  end