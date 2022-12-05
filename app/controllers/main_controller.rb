class MainController < ApplicationController
  before_action :must_be_logged_in
  before_action :role
  def index
  end

  def permission
  end
end
