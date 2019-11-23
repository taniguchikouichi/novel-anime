class Admin::LabelsController < ApplicationController
    # before_action :authenticate_admin!
    PER = 20
    def new
        @label = Label.new
    end

    def index
        @labels = Label.page(params[:page]).per(PER)
    end

    def create
        @label = Label.new(label_params)
        if @label.save
            flash[:label] = "出版社を作成しました。"
            redirect_to admin_labels_path
        else
            render :new
        end
    end

    def destroy
        @label = Label.find(params[:id])
        @label.destroy
        flash[:label] = "出版社を削除しました。"
        redirect_to admin_labels_path
    end

    private
    def label_params
        params.require(:label).permit(:label_name)
    end
end
