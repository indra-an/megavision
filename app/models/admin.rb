# == Schema Information
#
# Table name: admins
#
#  id                  :integer          not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string
#  last_sign_in_ip     :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :timeoutable, :lastseenable

  has_many :admin_logs
  has_many :admins_channel_cities
  has_many :channel_cities, through: :admins_channel_cities
end
