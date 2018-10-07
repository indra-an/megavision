class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_menu
  before_action :get_theme_setting

  include ActionView::Helpers::NumberHelper

  def after_sign_in_path_for(resource)
    SignedIn.create({admin: resource, data: SignedIn.to_json_api(resource)})
    admins_dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def get_menu
    @menus = MenuParent.active.order(position: :asc)
  end

  def get_theme_setting
    @theme = ThemeSetting.last
    @css = Liquid::Template.parse(@theme.css_tag.to_s, :error_mode => :strict)
    @header = Liquid::Template.parse(@theme.header.to_s, :error_mode => :strict)
    @menu = Liquid::Template.parse(@theme.menu.to_s, :error_mode => :strict)
    @dropdown_menu = Liquid::Template.parse(@theme.dropdown_menu.to_s, :error_mode => :strict)

    @footer = Liquid::Template.parse(@theme.footer.to_s, :error_mode => :strict)
    @js = Liquid::Template.parse(@theme.js_tag.to_s, :error_mode => :strict)
    @channel_cities = ChannelCity.order(:city => :asc)
  end
end
