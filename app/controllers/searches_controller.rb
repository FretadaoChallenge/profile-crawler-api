class SearchesController < ApplicationController

    # Search by name or description
    def search_member
        search_result = Member.all.search(params[:search])

        unless search_result.blank?
            render json: search_result
        end

    end

end
