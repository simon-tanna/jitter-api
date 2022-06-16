class ApplicationController < ActionController::API
    include Knock::Authenticable # all controllers can use knock
end
