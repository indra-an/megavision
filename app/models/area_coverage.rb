# == Schema Information
#
# Table name: area_coverages
#
#  id              :integer          not null, primary key
#  channel_city_id :integer
#  area            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  area_code_id    :integer
#  slug            :string
#

class AreaCoverage < ApplicationRecord
  belongs_to :channel_city
  belongs_to :area_code

  validates_uniqueness_of :area, scope: :channel_city_id

  after_save :save_channel_cities_type
  before_save :update_slug

  scope :by_slug, -> (slug) {
    where(channel_cities: {slug: slug}) if slug.present?
  }

  scope :by_area, -> (area) {
    where(["lower(area) like :value", {value: "%#{area.downcase}%"}])
  }

  scope :join_table, -> {
    joins(:channel_city)
  }
  #download template
  def self. download_template
    require "writeexcel"
    workbook = WriteExcel.new("public/template_xls/download_template_coverage.xls")
    worksheet = workbook.add_worksheet
    # worksheet.hide_gridlines(2)

    format = workbook.add_format(bold: 1, align: "center", valign: "center", border: 1)

    worksheet.set_column(0, 0,  30)
    worksheet.set_column(1, 0,  50)

    channel_city = ChannelCity.all.map { |p| [p.city] }
    code = AreaCode.all.map { |p| [p.code] }

    worksheet.data_validation("A2:A999",
            validate: "list",
        value: channel_city)

    worksheet.data_validation("B2:B999",
            validate: "list",
        value: code)

    worksheet.write(0 , 0,  "CITY", format)
    worksheet.write(0 , 1,  "CODE", format)
    worksheet.write(0 , 2,  "AREA", format)

    workbook.close
  end


  #import from excel
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
    else
      return false
      # raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    status, err_message = true, nil
    if spreadsheet
      header = spreadsheet.row(1)
      self.transaction do
        begin
          (2..spreadsheet.last_row).each do |i|
            header = header.map { |x| x.split.join("_").downcase }
            data = Hash[[header, spreadsheet.row(i)].transpose]

            if data["city"].present?
              city = ChannelCity.where(city: data["city"]).first
              data["channel_city_id"] = city.id if city.present?
            end

            if data["code"].present?
              code = AreaCode.where(code: data["code"]).first
              data["area_code_id"] = code.id if code.present?
            end

            area = self.new(data.except("city", "code"))
            area.save!
          end
        rescue => e
          status, err_message = false, "Failed to Import Area"
          ActiveRecord::Rollback
        end
      end
    else
      status, err_message = false, "Only file xls or xlsx will be allowed"
    end

    return status, err_message
  end

  def to_api
    {
      id: id,
      area: area,
      slug: slug
    }
  end

  def to_check_api
    {
      id: id,
      area: [area, channel_city.city].join(", "),
      slug: slug,
      city_slug: channel_city.slug
    }
  end

  private
    def save_channel_cities_type
      self.area_code.channel_types.map{|x| x.channel_cities_types.where(channel_city_id: self.channel_city_id).first_or_create}
    end

    def update_slug
      slug = self.area.truncate(48).parameterize
      self.slug = slug
    end
end
