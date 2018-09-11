# admins
unless Admin.find_by_email('admin@megavision.com').present?
   Admin.create({ :email => 'admin@megavision.com', :password => 'megavision2017' })
end

#menu
unless MenuSetting.exists?
  menu = [
          {menu: 'Beranda', type: 'MenuParent', position: 1, link_type: :scroll },
          {menu: 'Area Cakupan', type: 'MenuParent', position: 2, link_type: :redirect},
          {menu: 'Paket', type: 'MenuParent', position: 3, link_type: :scroll },
          {menu: 'Jadwal Acara', type: 'MenuParent', position: 4, link_type: :scroll },
          {menu: 'Tentang Kami', type: 'MenuParent', position: 5, link_type: :scroll },
          {menu: 'Bantuan', type: 'MenuParent', position: 6, link_type: :scroll },
          {menu: 'Karir', type: 'MenuParent', position: 7, link_type: :scroll }
        ]

  MenuSetting.create(menu)

  child_tentang = MenuSetting.find_by_slug('tentang-kami')
  child_menu = [ {menu: 'Sejarah', type: 'MenuChild', position: 8, parent_id: child_tentang.id, link_type: :scroll}]
  MenuSetting.create(child_menu)

  child_bantuan = MenuSetting.find_by_slug('bantuan')
  child_menu = [
        {menu: 'FAQ', type: 'MenuChild', position: 9, parent_id: child_bantuan.id, link_type: :scroll},
        {menu: 'Kontak Kami', type: 'MenuChild', position: 10, parent_id: child_bantuan.id, link_type: :scroll}
      ]
  MenuSetting.create(child_menu)

end

#channel cities
unless ChannelCity.exists?
   city = [{city: "BANDUNG"},
             {city: "BOGOR"}
            ]
   ChannelCity.create(city)
end

#packages
unless Package.exists?
  package = [{name: "Silver"},
                   {name: "Gold"}
                  ]
  Package.create(package)
end

#questions
unless Question.exists?
   question = "Apa saja channel yang diberikan?"
   answer = "Menyajikan kepada pemirsa channel lengkap sesuai kebutuhan keluarga mulai dari saluran keluarga, channel favorit anak, film, olah raga, pengetahuan, hiburan, berita nasional maupun Internasional."
   Question.create({question: question, answer: answer})
end

#preference
company_history = "PT Indonesia Broadband Communication (Megavision) adalah perusahaan yang bergerak di bidang jasa telekomunikasi khususnya, TV Kabel. Megavision berdiri pada tanggal 4 Mei 2001 dan beralamat di Jalan Karang Layung 27 Bandung. <br><br>

                Tidak hanya di Bandung, Megavision pun melakukan pengembangan ke wilayah Bogor, Semarang, Malang, Medan, Bekasi, Depok, Balikpapan, Palembang, dan kota lainnya. Dengan menggunakan teknologi kabel coaxial dan fiber optic, Megavision telah melakukan penjualan di seluruh area yang sudah tercover di Indonesia.<br><br>

                Di Bogor, Megavision berdiri dan berkembang dengan nama PT. Indonesia Cable Network pada tanggal 28 November 2008. Lalu Megavision mengembangkan teknologinya tidak hanya TV Kabel tetapi juga produk Internet. "

company_vision_mission = []
company_vision_mission << "Memberikan kemudahan kepada masyarakat dalam mendapatkan akses informasi yang disajikan oleh penyelenggara jasa TV Kabel melalui pembangunan jaringan HFC (Hybrid Fiber Coaxial)"
company_vision_mission << "Menyediakan pelayanan dengan standar internasional"
company_vision_mission << "Menghubungkan industri, pemerintah dan masyarakat, sehingga tercipta kondisi yang selaras dan seimbang utamanya dalam penataan penyelenggaraan telekomunikasi di Indonesia"
company_vision_mission << "Menunjang program pemerintah dalam meningkatkan taraf hidup masyarakat"

address = []
address << "Bandung 1|Jl. Karang Tinggal No. 27 Cipedes Sukajadi|022 - 2042624"

unless Preference.exists?
   Preference.create({company_history: company_history, company_vision_missions: company_vision_mission, addresses: address})
end
