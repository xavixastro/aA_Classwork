class CatsController < ApplicationController


    def index
        @cat_list = Cat.all
        render :index
    end

    def show
        @single_cat = Cat.find(params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @single_cat = Cat.new(cat_params)
        if @single_cat.save
            redirect_to cat_url(@single_cat)
        else
            render :new
        end
    end

    def edit
        @single_cat = Cat.find(params[:id])
        render :edit
    end

    def update
        @single_cat = Cat.find(params[:id])
        if @single_cat.update(cat_params)
            redirect_to cat_url(@single_cat)
        else
            render :edit
        end
    end

    def cat_params
        params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
    end
    
end
