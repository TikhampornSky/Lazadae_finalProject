class MainController < ApplicationController
  before_action :must_be_logged_in
  def index
  end
end
