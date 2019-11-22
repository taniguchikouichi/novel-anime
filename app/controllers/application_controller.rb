class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search

    def after_sign_in_path_for(resource)
        if admin_signed_in?
            admin_top_path
        else
            novels_path
        end
    end

    def set_search
        #@search = Novel.search(params[:q])
        @search = Novel.ransack(params[:q]) #ransackメソッド推奨
        @search_novels = @search.result.all
    end

    # private
    # def after_sign_in_path_for(resorce)

    protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end

end

