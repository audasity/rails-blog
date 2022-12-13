class ApplicationController < ActionController::Base
    # only the index page should be available for non logged in users should see
    # If user tried to access any route such as /articles without being logged in
    # User is sent to login page
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        articles_path # your path
    end
end
