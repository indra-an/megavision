# == Schema Information
#
# Table name: theme_settings
#
#  id            :integer          not null, primary key
#  title         :string
#  body_class    :string
#  css_tag       :text
#  header        :text
#  menu          :text
#  dropdown_menu :text
#  footer        :text
#  js_tag        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ThemeSetting < ApplicationRecord
end
