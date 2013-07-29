class ApplicationController < ActionController::Base
  include AuthHelper
  protect_from_forgery

  before_filter :authenticate
end
