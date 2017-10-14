class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionView::Helpers::NumberHelper

  def after_sign_in_path_for(resource)
    SignedIn.create({admin: resource, data: SignedIn.to_json_api(resource)})
    admins_dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
