class SearchesController < ApplicationController

    # Search by name or description
    def search_member
        search_result = Member.all.search(params[:search])

        return render json: search_result if !search_result.blank?
    end

end
