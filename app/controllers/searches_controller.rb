class SearchesController < ApplicationController

    # Search by name or description
    def search_member
        search_result = Member.all.search(params[:search])

        if search_result.blank?
            render status: :unprocessable_entity
        else
            render json: search_result
        end
    end

end
