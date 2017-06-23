# admins
unless Admin.find_by_email('admin@megavision.com').present?
   Admin.create({ :email => 'admin@megavision.com', :password => 'megavision2017' })
end

#channel cities
unless ChannelCity.exists?
   city = [{city: "BANDUNG"},
             {city: "BOGOR"}
            ]
   ChannelCity.create(city)
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
