class AdminController < ApplicationController
  before_action :authorize, except: [:index, :show]

end
