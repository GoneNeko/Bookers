class TopController < ApplicationController
    def index
        @a = current_user
    end

    def about
        @a = current_user
    end
end
