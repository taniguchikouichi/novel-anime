class Admin::LabelsController < ApplicationController
    def new
        @label = Label.new
    end

    def index
        @labels = Label.all
    end

    def create
        @label = Label.new(label_params)
        if @label.save
            redirect_to admin_labels_path
        else
            render :new
        end
    end

    def destroy
        @label = Label.find(params[:id])
        @label.destroy
        redirect_to admin_labels_path
    end

    private
    def label_params
        params.require(:label).permit(:label_name)
    end
end
