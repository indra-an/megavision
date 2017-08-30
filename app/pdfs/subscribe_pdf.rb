class SubscribePdf < Prawn::Document
  def initialize(data)
    super

    table [
        ["Nama Lengkap", ":", data['name']],
        ["No KTP/Passport", ":", data['ktp']],
        ["Mobile Phone", ":", data['mobile']],
        ["Email", ":", data['email']],
        ["Date", ":", data['date']],
        ["Home Phone", ":", data['phone']],
        ["Product", ":", "#{data['package']} (#{data['product_speed']} #{data['product_price']})"],
        ["Address", ":", data['kelurahan']],
        ["Kelurahan", ":", data['kecamatan']],
        ["Kecamatan", ":", data['city']],
        ["Provinsi", ":", data['province']],
        ["Kode Pos", ":", data['postal_code']]
     ], :cell_style => {:border_width => 0}

  end
end
