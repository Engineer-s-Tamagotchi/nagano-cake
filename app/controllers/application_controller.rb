class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  before_action :authenticate_customer!, except: [:top, :about], unless: :admin_url
  
  def admin_url
    request.fullpath.include?("/admin")
  end
  
end