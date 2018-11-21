# admins
unless Admin.find_by_email('admin@megavision.com').present?
   Admin.create({ :email => 'admin@megavision.com', :password => 'megavision2017' })
end

#menu
unless MenuSetting.exists?
  menu = [
          {
            menu: 'Beranda',
            type: 'MenuParent',
            position: 1,
            link_type: :scroll,
            html_content: '  <section id="{{section_home}}" class="caro-sect">
            <div class="container-fluid">
              <div class="row">
                <div id="main-carousel" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    {{carousel_indicator}}
                  </ol>
                  <div class="carousel-inner caro-mega1" role="listbox">
                    {{carousel_image}}
                  </div>

                  <!-- Left and right controls -->
                  <a class="left carousel-control" href="#main-carousel" role="button" data-slide="prev">
                    <span class="glyphicon" aria-hidden="true"><i class="fa fa-angle-double-left font-32 white" aria-hidden="true"></i></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="right carousel-control" href="#main-carousel" role="button" data-slide="next">
                    <span class="glyphicon" aria-hidden="true"><i class="fa fa-angle-double-right font-32 white" aria-hidden="true"></i></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>
            </div>
          </section>',
          html_additional: {
              carousel_indicator: '<li data-target="#main-carousel" data-slide-to="{{index}}" class="{{class_active}}"></li>',
              carousel_image: '<div class="item {{class_active}}">
                                <div class="caro-cover mob"> <!-- cover buat mobile -->
                                  <img src="{{cover_mobile}}" />
                                </div>

                                <div class="caro-cover desk"> <!-- cover buat desktop -->
                                  <img src="{{cover_desktop}}" />
                                </div>
                              </div>'
            }
          },
          {menu: 'Area Cakupan', type: 'MenuParent', position: 2, link_type: :redirect},
          {
            menu: 'Paket',
            type: 'MenuParent',
            position: 3,
            link_type: :scroll,
            html_content: '
            <section class="area-channel-sect text-center sec-package" id="{{section_package}}" style="background: url({{background_area_channel_url}});">
              <div class="container">
                <div class="row">
                  {{channel_city}}
                </div>
              </div>
            </section>',
            html_additional: {
              channel_city: '<div class="channel-sec">
                              <a class="channel-btn" href="{{link_package}}">
                                <div class="border-1px outer-border">
                                  <div class="channel-btn-name">
                                    <p class="font-18"><b class="font-24">{{city_name}}</b><br>Channel List</p>
                                  </div>
                                </div>
                              </a>
                            </div>'
              }
          },
          {
            menu: 'Jadwal Acara',
            type: 'MenuParent',
            position: 4,
            link_type: :scroll,
            html_content: '
              <section class="mov-schedule" id="{{section_movie_schedule}}">
                <div class="container">
                  <div class="title"><h2 class="uppercase text-center white bold">TV Guide</h2></div>
                  <div class="row">
                    {{movie_schedule}}
                  </div>
                </div>
              </section>',
            html_additional: {
              movie_schedule: '<div class="chan-mov">
                               <a class="btn-schedule" href="{{link_schedule}}">
                                <img alt="{{movie_title}}" src="{{movie_logo}}">
                              </a>
                             </div>'
              }
           },
          {menu: 'Tentang Kami', type: 'MenuParent', position: 5, link_type: :scroll },
          {menu: 'Bantuan', type: 'MenuParent', position: 6, link_type: :scroll },
          {
            menu: 'Karir',
            type: 'MenuParent',
            position: 7,
            link_type: :scroll,
            html_content: '<section id="{{section_vacancy}}" class="job-vacan-sect" style="background: url({{background_vacancy}});background-size: cover;background-position: center;">
            <div class="container">
              <h2 class="uppercase text-center white bold">Job Vacancy</h2>
                {{vacancy_list}}
            </div>
            </section>',
            html_additional: {
              vacancy: '<div class="btn-group-vacan col-md-3 col-sm-4 col-xs-6">
                          <a class="btn-vacan col-xs-12 border-1px-white no-padding" href="{{vacancy_link}}">
                            <div class=" text-center">
                              <div class="border-bot-1px bg-white-opa"><h3>{{vacancy_position}}</h3></div>
                              <div class="img-vacan">
                                <img src="{{vacancy_icon}}">
                              </div>
                              <span class="border-1px-white pull-right">more-detail</span>
                            </div>
                          </a>
                        </div>'
              }
          }
        ]

  MenuSetting.create(menu)

  child_tentang = MenuSetting.find_by_slug('tentang-kami')
  child_menu = [ {
    menu: 'Sejarah',
    type: 'MenuChild',
    position: 8,
    parent_id: child_tentang.id,
    link_type: :scroll,
    html_content: '
    <section id="{{section_history}}" class="about-us-sect">
      <div class="container-fluid no-padding">
        <h2 class="mega-blue uppercase text-center bold">About Us</h2>
        <div class="short-history">
          <div class="singkatnya blue-bg col-xs-12 col-md-12 no-padding" >
            <div class="img-thumb col-md-5 col-xs-12 no-padding" style="background: url({{background_history}});background-size: cover;background-position: center;"></div>
            <div class="col-md-7 col-xs-12">
              <h3 class="white">Sejarah Singkat</h3>
              <div class="white">{{company_history}}</div>
              </p>
            </div>
          </div>
        </div>

        <hr class="border-white-1px">

        <div class="short-history">
          <div class="singkatnya blue-bg col-xs-12 col-md-12 no-padding" >
            <div class="col-md-7 col-xs-12">
              <h3 class="white">Visi dan Misi</h3>
              <ul>
                {{vision_mission_list}}
              </ul>
            </div>
            <div class="img-thumb col-md-5 col-xs-12 no-padding" style="background: url({{background_vision_mision}});background-size: cover;background-position: center;"></div>
          </div>
        </div>
      </div>
    </section>',
    html_additional: {
      vision_mission: '<li class="white">{{vission_mission}}</li><br/>'
      }
  }]
  MenuSetting.create(child_menu)

  child_bantuan = MenuSetting.find_by_slug('bantuan')
  child_menu = [
        {
          menu: 'FAQ',
          type: 'MenuChild',
          position: 9,
          parent_id: child_bantuan.id,
          link_type: :scroll,
          html_content: '
          <section id="{{section_faq}}" class="q-and-a-sect" style="background: url({{background_question_answer}});background-size: cover;background-position: center;">
          <div class="container">
            <div class="row">
              <h2 class="uppercase text-center white bold">Questions and Answers</h2>
              <div class="panel-group " id="accordion-question">
                {{faq_list}}
              </div>
            </div>
          </div>
        </section>',
          html_additional: {
            faq: '<div class="panel panel-default bg-transparent">
                      <div class="panel-heading bg-transparent question-title">
                        <h4 class="panel-title mega-yellow bold border-bot-1px">
                          <a data-toggle="collapse" data-parent="#accordion-question" href="#question{{index}}" class="" aria-expanded="true">
                            {{question}}<i class="fa fa-plus-circle pull-right font-18" aria-hidden="true"></i>
                          </a>
                        </h4>
                      </div>
                      <div id="question{{index}}" class="panel-collapse collapse in" aria-expanded="true" style="">
                        <div class="panel-body white no-border">
                          {{answer}}
                          {{download_attachment}}
                        </div>
                      </div>
                    </div>'
              }
        },
        {
          menu: 'Kontak Kami',
          type: 'MenuChild',
          position: 10,
          parent_id: child_bantuan.id,
          link_type: :scroll,
          html_content: '
          <section id="{{section_contact}}" class="contact-sect" style="background: url({{background_contact}});background-size: cover;background-position: center;">
            <div class="container">
              <h2 class="uppercase text-center white bold">Contact Us</h2>
              <div class="col-md-4 col-sm-5 col-xs-12 address white">
                {{address_list}}

              </div>

              <div class="col-md-8 col-sm-7 col-xs-12 contact-form">
                {{form_contact}}
              </div>
            </div>
          </section>',
        html_additional: {
          address_list: '<div class="address-det">
                      <h4 class="bold white no-margin">{{city}}</h4>
                      <p class="no-margin font-12">{{address}}</p>
                    </div>'
          }
        }
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

Preference.last.update({about_megavision_html:
  '<section id="{{section_about}}" class="about-mega">
    <div class="container text-center">
      <div class="row">
        <div class="mega-logo-tag">
          <image src="/assets/logo-tag.png" />
        </div>
        <p>{{about_megavision}}</p>
        <div class="mega-benefit">
          {{about_product_megavision}}
        </div>
      </div>
    </div>
  </section>',
  about_product_html: '<div class="benefit-det text-center">
      <image src="{{product_image}}" class="benefit-img" alt="{{product_title}}" />
      <h5 class="mega-blue">{{product_description}}</h5>
    </div>'
})

unless ThemeSetting.exists?
  ThemeSetting.create({
    title: 'Megavision',
    body_class: 'landing-page',
    css_tag: '<style type="text/css">
    /** custom icon **/
    @charset "UTF-8";

    @font-face {
      font-family: "custom-font";
      src:font-url("custom-font.eot");
      src:font-url("custom-font.eot?#iefix") format("embedded-opentype"),
        font-url("custom-font.woff") format("woff"),
        font-url("custom-font.ttf") format("truetype"),
        font-url("custom-font.svg#custom-font") format("svg");
      font-weight: normal;
      font-style: normal;

    }

    [data-icon]:before {
      font-family: "custom-font" !important;
      content: attr(data-icon);
      font-style: normal !important;
      font-weight: normal !important;
      font-variant: normal !important;
      text-transform: none !important;
      speak: none;
      line-height: 1;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }

    [class^="icon-"]:before,
    [class*=" icon-"]:before {
      font-family: "custom-font" !important;
      font-style: normal !important;
      font-weight: normal !important;
      font-variant: normal !important;
      text-transform: none !important;
      speak: none;
      line-height: 1;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }

    .icon-satelit:before {
      content: "\61";
    }
    .icon-wifi:before {
      content: "\62";
    }

    .notification {
      position: fixed;
      top: 5em;
      right: 2em;
      z-index: 99999;
    }

    /** universal **/
    .margin-0 {
        margin: 0;
    }

    .no-border {
        border: none !important;
    }

    .mega-yellow {
        color: #ffea00
    }

    .bg-transparent {
        background-color: transparent !important;
    }

    .uppercase {
        text-transform: uppercase;
    }

    .mega-blue {
        color: #0072bc;
    }

    .bold {
        font-weight: 700;
    }

    .font-18 {
        font-size: 18px;
    }

    .font-12 {
        font-size: 12px;
    }

    .font-24 {
        font-size: 24px;
    }

    .white {
        color: white;
    }

    .full-img {
        width: 100%;
    }

    /**{
         font-family: "Lato", sans-serif;
       -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }*/

    h1,h2,h3,h4,h5,h6 {
        font-family: "Open Sans", sans-serif
    }

    .bold {
        font-weight: 900;
    }

    .italic {
        text-transform: italic;
    }

    .gap-50 {
        padding: 0 50px;
    }

    /** navbar **/
    .navbar-megavision {
        padding: 10px 0;
    }

    .navbar-default {
        padding: 10px 20px;
    }

    .navbar-nav>li>a {
        padding: 10px 0;
    }

    .check-area-par {
        padding-top: 15px;
    }

    .check-area-btn {
        width: auto;
        background: #0072bc;
        text-align: center;
        color: white;
        padding: 3px 15px;
        font-size: 10px;
        float: right;
    }

    .check-area-btn:hover {
        background: #185e8c;
        color:white;
        text-decoration: none;
    }

    .fa-map-marker {
        margin-right: 5px;
    }

    .nav li a {
        text-transform: uppercase;
    }

    .nav li a {
        margin-left: 20px;
    }

    .nav li a.active {
        color:#0072bc;
    }

    .navbar-brand {
        display: block;
        float: right;
        padding: 10px;
        height: auto;
    }

    .navbar-brand img {
        height: 50px;
    }

    .navbar-default {
        padding: 5px 20px;
    }

    .navbar-default {
        background-color: rgba(255,255,255,0.7);
        border-color: transparent;
    }

    /** carosel sect **/
    .caro-sect {
        height: 100vh;
        overflow: hidden;
    }

    .blue-opa {
        background: rgba(0,114,188,0.6);
    }

    .detail-caro1.blue-opa {
        position: absolute;
        right: 0;
        height: 100%;
        width: 45%;
    }

    .detail-caro1 div {
      top: 45%;
      transform: translateY(-45%);
      position: absolute;
      width: 100%;
      padding: 0 15%;
    }

    h2.det-title {
        font-size: 38px;
        color: white;
        text-align: center;
        width: 100%;
    }

    .jadwal-mov {
        margin-top: 30px;
        display: block;
        text-align: center;
    }

    /** channel-list **/

    .channel-sec {
        padding: 35px;
        text-align: center;
        display: inline-block;
        margin-top: 120px;
    }

    .area-channel-sect {
        height: 500px;
    }

    .border-1px.outer-border {
        border: 1px solid white;
        padding: 15px;
        display: inline-block;
    }

    .channel-btn-name {
        background: rgba(255,255,255,0.75);
        padding: 45px 75px;
        display: inline-block;
        color: #232323
    }

    .border-1px-white {
        border: 1px solid white
    }

    a:hover .border-1px.outer-border {
        border-color: #ffea00 !important;
    }

    a:hover .channel-btn-name {
        background: rgba(255,234,0,0.75);
        color: white;
    }

    /** starnet-sect **/
    .logo-star img {
        height: 125px;
    }

    .starnet-sect, .product-sect,.about-mega, .q-and-a-sect, .about-us-sect, .job-vacan-sect, .contact-sect {
        padding-top: 70px;
        padding-bottom: 70px;
    }

    sub.font-12 {
        margin-left: -30px;
    }

    .star-price h2 {
        margin-bottom: 5px;
        margin-top: 0px;
    }

    .star-price p {
        margin: 0;
    }

    .star-price {
        display: inline-block;
        margin: 10px;
        border: 1px solid #0072bc;
        padding: 10px 15px;
    }

    /** product **/
    .big-one {
        font-size: 100px
    }

    .product-list a {
        display: inline-block;
        text-align: center;
        border: 3px solid #0072bc;
        padding: 25px 55px;
        text-transform: uppercase;
        margin: 15px 30px;
    }

    .product-list a:hover {
        text-decoration: none;
        color: white;
        background: #0072bc;
    }

    .product-sect h2.mega-blue {
        margin-bottom: 30px;
    }

    .mega-logo-tag img {
        height: 150px;
    }

    .mega-benefit {
        margin-top: 35px;
    }

    .benefit-img {
        width: 75px;
    }

    .benefit-det h5 {
        margin: 5px 0;
    }

    .benefit-det {
        display: inline-block;
        border: 1px solid #0072bc;
        width: 175px;
        padding: 10px 10px 15px;
        margin: 0 25px;
    }

    /** question and answer **/
    #accordion-question {
        margin: 50px 0 0 ;
    }

    .panel-default.bg-transparent {
        border: none;
    }

    .question-title {
        padding-bottom: 20px;
    }

    .border-bot-1px {
        border-bottom: 1px solid white;
    }

    h4.panel-title.mega-yellow.bold.border-bot-1px {
        padding-bottom: 25px;
    }

    .panel-body.white.no-border {
        padding-top: 0px;
    }

    /** about-us **/
    .blue-bg {
        background-color: #0072bc;
    }

    .history-det {
        height: 100% !important;
    }

    .short-history {
        display: block;
        width: 100%;
        height: auto;
        overflow: hidden;
    }

    .img-thumb.col-md-5.col-xs-12.no-padding {
        height: 321px;
    }

    .singkatnya.blue-bg.col-xs-12.col-md-12 h3 {
        margin-bottom: 25px;
        padding: 5px 30px 0;
    }

    .singkatnya.blue-bg.col-xs-12.col-md-12 p {
        padding: 0 30px;
    }

    .no-padding {
        padding: 0;

    }

    hr.border-white-1px {
        width: 100%;
        border: 1px solid white;
        margin: 2px;
    }

    .about-us-sect h2 {
        margin-bottom: 30px;
    }

    .bg-white-opa {
        background-color: rgba(255,255,255,0.6);
    }

    .btn-group-vacan a div div h3 {
        margin: 0;
        padding: 20px 0;
        color: black;
    }

    .about-us-sect {
        padding-bottom: 0;
    }

    .about-us-sect h2 {
        margin-bottom: 55px;
    }

    .img-vacan img {
        width: 38%;
        margin-bottom: 25px;
    }

    .btn-group-vacan a .bg-white-opa {
        margin-bottom: 15px;
    }

    .btn-group-vacan a span {
        margin: 0 15px 15px;
        color: white;
        padding: 5px;
    }

    .btn-group-vacan a:hover .bg-white-opa {
        background-color: rgba(201,226,54,0.6);
    }

    .btn-group-vacan a:hover {
        text-decoration: none;
    }

    .btn-group-vacan a:hover .bg-white-opa h3 {
        color: white;
        text-decoration: none;
    }

    .btn-group-vacan a.border-1px-white:hover, .btn-group-vacan a:hover span {
        border-color: #ffea00;
    }

    .btn-group-vacan a:hover span {
        color: #ffea00;
    }

    .btn-group-vacan a.border-1px-white:hover .border-bot-1px {
        border-color: #ffea00;
    }

    .job-vacan-sect .container h2 {
        margin-bottom: 55px;
    }


    /** contact-us **/
    .no-margin {
        margin: 0;
    }

    .contact-sect .container h2 {
        margin-bottom: 55px;
    }

    .address-det {
        margin-bottom: 20px;
    }

    .contact-input .form-control,.contact-input .textarea {
        border-radius: 0;
        background-color: transparent !important;
        color: white !important;
        border-color: white;
    }

    .contact-input .textarea {
        width: 100%;
        padding: 5px 12px;
    }

    .btn-send {
        background-color: transparent;
        border:1px solid white;
        padding: 5px 15px;
        text-align: center;
        color: white;
    }

    .btn-send:hover {
        background-color: #ffea00;
        text-decoration: none;
    }

    .contact-input .form-control::-webkit-input-placeholder, .contact-input .textarea::-webkit-input-placeholder { /* Chrome/Opera/Safari */
      color:white;
    }
    .contact-input .form-control::-moz-placeholder, .contact-input .textarea::-moz-placeholder { /* Firefox 19+ */
      color:white;
    }
    .contact-input .form-control:-ms-input-placeholder, .contact-input .textarea:-ms-input-placeholder { /* IE 10+ */
      color:white;
    }
    .contact-input .form-control:-moz-placeholder, .contact-input .textarea:-moz-placeholder { /* Firefox 18- */
      color: white;
    }

    /** footer **/
    .bg-grey {
        background-color: #707070;
    }

    .footer {
        padding: 50px 20px;
        position: relative;
    }

    .social i {
        margin: 0 7px;
    }

    .to-top {
        padding: 7px 12px;
        position: absolute;
        top: -33px;
        margin-left: -19px;
    }

    /** channel style **/

    .channel-list-page {
        min-height: 100vh;
    }

    .absolute-parent {
        position: relative;
    }

    .absolute {
        position: absolute;
    }

    .bg-white {
        background-color: white;
    }

    .channel-list-page {
        padding: 165px 0 55px;
    }

    .title-channel-area {
        padding: 6px 15px;
        top: -17px;
        min-width: 280px;
    }

    .title-channel-area img {
        width: 23px;
        margin-right: 8px;
    }

    .title-channel-area h4 {
        margin: 2px 0 0;
    }

    .channel-list-box {
        padding: 45px 15px 25px;
    }

    /*vacancy*/

    .vacan-location {
        margin-bottom: 45px;
    }

    .vacancy-page {
        min-height: 100vh;
    }

    .vacancy-detail {
        margin-bottom: 55px;
    }

    .vacancy-page {
        padding: 165px 0 0;
    }

    .other-vacan {
        padding: 75px 25px;
    }

    .btn-vacan.active .bg-white-opa {
        background-color: rgba(201,226,54,0.6);
    }

    .btn-vacan.active {
        text-decoration: none;
    }

    .btn-vacan.active .bg-white-opa h3 {
        color: white;
        text-decoration: none;
    }

    .btn-vacan.active, .btn-vacan.active span {
        border-color: #ffea00;
    }

    .btn-vacan.active span {
        display: none;
    }

    .btn-vacan.active span {
        color: #ffea00;
    }

    .btn-vacan.active .border-bot-1px {
        border-color: #ffea00;
    }

    .check-area-sect {
        min-height: 100vh;
    }

    .check-opening {
        padding:135px 0 85px;
    }

    .check-opening h1 {
        font-size: 42px;
    }

    .channel-name div a.white:hover {
        color: white;
    }

    .check-input-grp {
        padding: 35px 0;
    }

    .tersedia {
        background-color: #9CFC97;
        padding: 15px 0;
    }

    .ok-color {
        color: #568A53;
    }

    .no-color {
        color: #AE1A2C;
    }

    span i, span i {
        font-size: 18px;
        margin-right: 6px;
    }

    .btn-cek {
        padding: 7px 18px;
        color: white;
    }

    .btn-cek:hover {
        background: #185e8c;
        color: white;
    }

    .tdk-tersedia {
        padding: 15px 0;
        background-color: #F14B5F;
    }

    /** font menu **/
    .navbar-default .navbar-nav>li>a {
        font-size: 18px;
    }

    .carousel-inner {
        height: 100vh;
    }

    .caro-mega1 .item, .caro-mega1 .item.active {
        height: 100vh;
    }

    div#myCarousel {
        height: 100vh;
    }

    .carousel-control .glyphicon {
        top: 50%;
        text-align: center;
    }

    .font-32 {
        font-size: 32px;
    }

    .carousel-control {
        width: 10%;
    }

    #check-area-map {
        height: 80vh;
    }

    #check-area-search {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 4px;
        text-overflow: ellipsis;
        /*width: 75%;*/
        margin: 10px;
    }

    #check-area-search:focus {
        border-color: #4d90fe;
    }

    #available, #unavailable {
        display: none;
    }

    /** cover **/
    .caro-cover {
        width: 100%;
        height: 100vh;
    }

    .caro-cover img {
        width: 100%;
    }

    .caro-cover.mob {
        display: none;
    }

    @media (min-width: 769px) {
        .caro-cover.mob {
            display: none;
        }
    }

    @media (min-width: 768px) {
        .caro-cover.mob {
            display: block;
        }

        .caro-cover.desk {
            direction: none;
        }
    }


    /** channel list baru **/
    .title-channel-area-new {
        margin-bottom: 35px;
    }

    .channel-paket {
        margin: 0 auto;
        display: block;
        width: 780px;
    }

    .channel-paket li {
        margin: 0 60px;
    }

    .channel-paket li a {
        padding: 20px 20px;
        margin: 0;
        background: rgba(255,255,255,0.3);
        border-radius: 0;
        color: white;
        width: 250px;
        font-size: 17px;
    }

    .channel-paket li.active a {
        background: rgba(255,255,0,0.5);
        color: black !important;
    }

    .channel-paket li a:hover,.channel-paket li.active a:hover {
        background: rgba(255,255,0,0.7);
        color: black;
    }

    .bg-silver {
        background: rgba(171,171,171,1);
    }

    .kategori-channel {
        padding: 0 10px;
    }

    .list-kategori {
        padding: 10px 0;
        margin-bottom: 15px;
    }

    .list-kategori h5 {
        margin: 0;
    }

    .kategori-channel p {
        margin: 0;
        font-size: 12px;
    }

    .list-body {
        padding: 0 0 15px !important;
        width: 100%;
    }

    .lot-channel {
        height: auto;
    }

    .med-channel {
        height: auto;
    }

    .little-channel {
        height: auto;;
    }

    .paket-title {
        margin-bottom: 30px;
    }

    .list-channel {
        margin-bottom: 20px;
    }

    .bg-gold {
        background: rgba(205,163,44,1);
    }


    /** harga-paket **/
    .width-100 {
        width: 100%;
    }

    .width-100.row {
        margin: 0;
        padding: 0 20px;
    }

    .harga-paket a {
        width: 200px;
        padding: 15px;
        display: block;
        float: left;
        font-weight: 700;
        margin: 0 15px 15px;
    }

    .harga-paket {
        text-align: center;
    display: inline-block;
    }

    .harga-paket a p {
        font-size: 30px;
    }

    .harga-paket a p sup {
        margin-top: 10px;
        font-size: 18px;
        font-weight: 300;
        margin: 0 3px;
    }

    .harga-paket a.bg-silver:hover {
        text-decoration: none;
        background: rgba(131,131,131,1);
    }

    .harga-paket {
        padding: 35px 20px 55px;
    }

    .perbulan, .speednya {
        font-size: 12px !important;
        float: right;
        clear: both;
        margin-right: 5px;
        margin-top: -3px;
        font-weight: 300;
    }

    .perbulan {
        margin-top: -16px;
    }

    .speednya {
        margin-bottom: 0;
    }

    .italic {
        text-transform: italic;
    }

    .wrap-price {
        /* height: 57px; */
        padding-right: 5px;
        width: 130px;
        margin: 0 auto;
    }

    .harga-paket {
        text-align: center;
        display: block;
        margin: 0 auto;
        width: 500px;
    }

    .color-silver {
        color: rgb(171,171,171);
    }

    .color-gold {
        color: rgb(205,163,44);
    }

    .harga-paket a.bg-gold:hover {
        text-decoration: none;
        background: rgba(175,133,14,1);
    }

    .tab-pane br {
        clear: both;
    }

    .chan-area br {
        clear: both;
    }

    .channel-list-all .col-md-6.col-sm-12.no-padding .chan-area {
        padding-bottom: 502em !important;
        margin-bottom: -500em;
    }

    section.channel-list-all .container-fluid {
        overflow: hidden;
    }

    .channel-list-page {
        min-height: 50vh;
    }

    .channel-list-box {
        padding-top: 30px;
    }


    /** baru **/
    #custom-search-input{
        padding: 3px;
        border: solid 1px #E4E4E4;
        border-radius: 6px;
        background-color: #fff;
        margin-top: 35px;
    }

    #custom-search-input input{
        border: 0;
        box-shadow: none;
    }

    #custom-search-input button{
        margin: 2px 0 0 0;
        background: none;
        box-shadow: none;
        border: 0;
        color: #666666;
        padding: 0 4px 0 7px;
        border-left: solid 1px #ccc;
    }

    #custom-search-input button:hover{
        border: 0;
        box-shadow: none;
        border-left: solid 1px #ccc;
    }

    #custom-search-input .glyphicon-search{
        font-size: 23px;
    }

    .ket-search {
        font-size: 18px;
        margin-top: 10px;
    }

    .bg-white {
        background: white;
    }

    .harga-paket a {
        width: 200px;
        padding: 15px;
        display: inline-block;
         float: none;
        font-weight: 700;
        margin: 0 15px 15px;
        text-align: center;
    }

    .harga-paket {
        text-align: center;
        display: block;
        margin: 0px auto;
        width: 100%;
    }

    /** subscrie **/
    .subscribe {
        padding-top: 150px;
    }

    .input-tittle {
        margin-bottom: 30px;
    }

    .pilihan-package {
        padding: 50px 0 75px;
    }

    .select-package {
        text-align: center;
        color: white;
        float: left;
        margin: 34px 0 0;
    }

    .border-1px {
        border: 1px solid white;
    }

    div.cs-skin-rotate {
        width: 100%;
    }

    .cs-select.cs-skin-rotate {
        padding: 45px 15px;
    }

    .cs-skin-rotate > span {
        border: none;
    }

    .select-label {
        background: white;
        padding: 10px;
        width: 100%;
        color: #0072bc;
    }

    .cs-skin-rotate li span {
        opacity: 0.7;
        background: transparent;
    }

    .cs-skin-rotate .cs-selected span {
        opacity: 1 !important;
        background: transparent;
    }

    .cs-options {
        margin: 0 -15px;
    }

    .cs-select.cs-active .cs-options {
        visibility: visible;
        background: #0072bc;
        border-radius: 10px;
    }

    .cs-select ul {
        padding: 0 30px;
    }

    .input-tittle {
        padding-left: 15px;
    }

    .agreement .checkbox input[type="checkbox"] {
        margin-top: 23px;
    }

    .agreement {
        padding-left: 20px;
    }

    .subscribe .form-group {
        margin-bottom: 35px;
    }

    .subscribe-btn-act div a {
        background: #0072bc;
        color: white;
        padding: 10px 30px;
    }

    .subscribe-btn-act div a:hover {
        text-decoration: none;
        background: #07598e;
    }


    .subscribe-btn-act div input[type="submit"] {
        background: #0072bc;
        color: white;
        padding: 8px 30px;
        border: none;
        margin-top: -10px;
    }

    .subscribe-btn-act div input[type="submit"]:hover {
        text-decoration: none;
        background: #07598e;
    }

    .subscribe-btn-act {
        margin-bottom: 100px;
        clear: both;
        padding-top: 40px;
    }

    @media (max-width: 768px) {
        .subscribe-btn-act div a {
        background: #0072bc;
        color: white;
        padding: 10px 30px;
        display: block;
    }
    }

    .subscribe-modal {
        margin-top: 15em;
    }

    .product.input-tittle {
        margin-bottom: 10px;
    }

    .navbar-default .navbar-toggle .icon-bar {
        background-color: #0072bc;
    }

    /** floating **/

    .floating-contact {
        position: fixed;
        bottom: -2px;
        right: 20px;
        width: 300px;
        z-index: 10000;
        -webkit-box-shadow: 6px -4px 24px -10px rgba(0,0,0,0.35);
    -moz-box-shadow: 6px -4px 24px -10px rgba(0,0,0,0.35);
    box-shadow: 6px -4px 24px -10px rgba(0,0,0,0.35);
    }

    .contact-float h5 {
        float: left;
        font-size: 13px;
        color: white;
        margin: 3px 0;
        font-weight: 700;
    }

    .contact-float img {
        width: 87px;
        float: left;
        margin-top: -39px;
        margin-left: -39px;
    }

    .floating-contact div .card div#headingOne {
        height: 40px;
        display: block;
        clear: both;
        background: #1a567d;
    }

    .white-form-group {
        background: #e1e1e1;
        padding: 15px;
        width: 100%;
        height: 300px;
        position: relative;
    }

    .user-chat {
        background: white;
        padding:5px 10px 5px 13px;
        float: left;
    }

    .tri-right.border.left-top:before {
        content: " ";
        position: absolute;
        width: 0;
        height: 0;
      left: -40px;
        right: auto;
      top: -8px;
        bottom: auto;
        border: 32px solid;
        border-color: #666 transparent transparent transparent;
    }

    .talk-bubble {
      display: inline-block;
      position: relative;
        max-width: 80%;
        height: auto;
        background-color: lightyellow;
    }
    .border{
      border: 8px solid #666;
    }
    .round{
      border-radius: 30px;
        -webkit-border-radius: 30px;
        -moz-border-radius: 30px;
    }

    .tri-right.left-top.user:after {
        left: auto;
        right: -17px;
    }

    .talk-bubble.user {
        float: right;
        margin-right: 30px;
        margin-bottom: 25px;
        margin-top: 5px;
        position: relative;
        font-size: 13px;
    }

    .talk-bubble.admin {
        float: left;
        margin-left: 30px;
        margin-top: 5px;
        margin-bottom: 25px;
        position: relative;
        font-size: 13px;
    }

    .tri-right.left-top.admin:after {
        left: -17px;
        right: auto;
            border-color: #76b8e2 transparent transparent transparent;
    }

    .tri-right.left-top:after{
        content: " ";
        position: absolute;
        width: 0;
        height: 0;
      top: 0px;
        bottom: auto;
        border: 18px solid;
        border-color: lightyellow transparent transparent transparent;
    }

    .time-chat {
        position: absolute;
        bottom: -26px;
        font-size: 10px;
        color: #8c8b8b;
    }

    .user .time-chat {
        right: 0;
    }

    .admin .time-chat {
        left: 0
    }

    .talk-bubble.admin.tri-right.left-top .user-chat {
        background: #76b8e2;
        color: white;
    }

    .white-form-group {
        padding: 0;
    }

    .chat-view {
        height: 240px;
        overflow-y: scroll;
        padding-top: 10px;
    }

    .chat-input textarea {
        width: 78%;
        height: 60px;
        padding: 5px;
    }

    .floating-contact div .card div#headingOne a.contact-float h5 {
        padding: 9px;
        width: 100%;
    }

    .btn-sm {
        padding: 5px 10px;
        font-size: 12px;
        line-height: 1.5;
        border-radius: 3px;
        width: 22%;
        margin: 0;
        height: 60px;
        margin-left: -5px;
    }


    /** subscrie **/
    .subscribe {
        padding-top: 150px;
    }

    .input-tittle {
        margin-bottom: 30px;
    }

    .pilihan-package {
        padding: 50px 0 75px;
    }

    .select-package {
        text-align: center;
        color: white;
        float: left;
        margin: 34px 0 0;
    }

    .border-1px {
        border: 1px solid white;
    }

    div.cs-skin-rotate {
        width: 100%;
    }

    .cs-select.cs-skin-rotate {
        padding: 45px 15px;
    }

    .cs-skin-rotate > span {
        border: none;
    }

    .select-label {
        background: white;
        padding: 10px;
        width: 100%;
        color: #0072bc;
    }

    .cs-skin-rotate li span {
        opacity: 0.7;
        background: transparent;
    }

    .cs-skin-rotate .cs-selected span {
        opacity: 1 !important;
        background: transparent;
    }

    .cs-options {
        margin: 0 -15px;
    }

    .cs-select.cs-active .cs-options {
        visibility: visible;
        background: #0072bc;
        border-radius: 10px;
    }

    .cs-select ul {
        padding: 0 30px;
    }

    .input-tittle {
        padding-left: 15px;
    }

    .agreement .checkbox input[type="checkbox"] {
        margin-top: 23px;
    }

    .agreement {
        padding-left: 20px;
    }

    .subscribe .form-group {
        margin-bottom: 35px;
    }

    .subscribe-btn-act div a {
        background: #0072bc;
        color: white;
        padding: 10px 30px;
    }

    .subscribe-btn-act div a:hover {
        text-decoration: none;
        background: #07598e;
    }

    .subscribe-btn-act {
        margin-bottom: 100px;
        clear: both;
        padding-top: 40px;
    }

    @media (max-width: 768px) {
        .subscribe-btn-act div a {
        background: #0072bc;
        color: white;
        padding: 10px 30px;
        display: block;
    }
    }

    .subscribe-modal {
        margin-top: 15em;
    }

    .product.input-tittle {
        margin-bottom: 10px;
    }

    .navbar-default .navbar-toggle .icon-bar {
        background-color: #0072bc;
    }


    /** floating **/

    .floating-contact {
        position: fixed;
        bottom: -2px;
        right: 20px;
        width: 300px;
        z-index: 10000;
        -webkit-box-shadow: 6px -4px 24px -10px rgba(0,0,0,0.35);
    -moz-box-shadow: 6px -4px 24px -10px rgba(0,0,0,0.35);
    box-shadow: 6px -4px 24px -10px rgba(0,0,0,0.35);
    }

    .contact-float h5 {
        float: left;
        font-size: 13px;
        color: white;
        margin: 3px 0;
        font-weight: 700;
    }

    .contact-float img {
        width: 87px;
        float: left;
        margin-top: -39px;
        margin-left: -39px;
    }

    .floating-contact div .card div#headingOne {
        height: 40px;
        display: block;
        clear: both;
        background: #1a567d;
    }

    .white-form-group {
        background: #e1e1e1;
        padding: 15px;
        width: 100%;
        height: 300px;
        position: relative;
    }

    .user-chat {
        background: white;
        padding:5px 10px 5px 13px;
        float: left;
    }

    .tri-right.border.left-top:before {
        content: " ";
        position: absolute;
        width: 0;
        height: 0;
      left: -40px;
        right: auto;
      top: -8px;
        bottom: auto;
        border: 32px solid;
        border-color: #666 transparent transparent transparent;
    }

    .talk-bubble {
      display: inline-block;
      position: relative;
        max-width: 80%;
        height: auto;
        background-color: lightyellow;
    }
    .border{
      border: 8px solid #666;
    }
    .round{
      border-radius: 30px;
        -webkit-border-radius: 30px;
        -moz-border-radius: 30px;
    }

    .tri-right.left-top.user:after {
        left: auto;
        right: -17px;
    }

    .talk-bubble.user {
        float: right;
        margin-right: 30px;
        margin-bottom: 25px;
        margin-top: 5px;
        position: relative;
        font-size: 13px;
        clear: both;
    }

    .talk-bubble.admin {
        float: left;
        margin-left: 30px;
        margin-top: 5px;
        margin-bottom: 25px;
        position: relative;
        font-size: 13px;
        clear: both;
    }

    .tri-right.left-top.admin:after {
        left: -17px;
        right: auto;
            border-color: #76b8e2 transparent transparent transparent;
    }

    .tri-right.left-top:after{
        content: " ";
        position: absolute;
        width: 0;
        height: 0;
      top: 0px;
        bottom: auto;
        border: 18px solid;
        border-color: lightyellow transparent transparent transparent;
    }

    .time-chat {
        position: absolute;
        bottom: -26px;
        font-size: 10px;
        color: #8c8b8b;
    }

    .user .time-chat {
        right: 0;
    }

    .admin .time-chat {
        left: 0
    }

    .talk-bubble.admin.tri-right.left-top .user-chat {
        background: #76b8e2;
        color: white;
    }

    .white-form-group {
        padding: 0;
    }

    .chat-view {
        height: 269px;
        overflow-y: scroll;
        padding-top: 10px;
    }

    .chat-input input {
        width: 78%;
        height: 30px;
        padding: 5px;
    }

    .floating-contact div .card div#headingOne a.contact-float h5 {
        padding: 9px;
        width: 100%;
    }

    .btn-sm {
        padding: 5px 10px;
        font-size: 12px;
        line-height: 1.5;
        border-radius: 3px;
        width: 22%;
        margin: 0;
        height: 30px;
        margin-left: -5px;
    }

    div.cs-select {
        max-width: 650px;
    }


    *, *:before, *:after {box-sizing:  border-box !important;}

    .chan-area br {
        clear: both;
        display: none;
    }

    body {
        width: 100% !important;
        overflow-x: hidden;
    }

    .other.price-list {
      display: none;
    }

    .wrap-price {
        width: 150px;
    }



    @media (min-width: 1024px) {
    section.sec-package {
        height: auto;
    }

    section#sec-product .container, section.sec-package .container {
        position: relative;
        min-height: 100vh !important;
    }

    section#sec-product .row, section.sec-package .row {
        position: absolute;
        top: 50%;
        transform: translateY(-56%);
        width: 100% !important;
    }
    }

    .start-chat {
      padding: 15px;
      position: absolute;
      z-index: 1000;
      background: #e1e1e1;
      width: 100%;
      height: 100%;
    }

    .start-chat .form-control {
        color: black !important;
        background: white !important;

    }

    .start-chat .form-control:before {
        color: #777 !important;
    }


    .dropbtn {
      color: white;
      border: none;
    }

    .dropdown {
      position: relative;
      display: inline-block;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f1f1f1;
      min-width: 175px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      z-index: 1;
    }

    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }

    .dropdown-content a:hover {background-color: #ddd;}

    .dropdown:hover .dropdown-content {display: block;}

    .dropdown:hover .dropbtn {background-color: transparent;}

    .dropdown-content a {
      margin-left: 0 !important;
    }

    .benefit-img {
      width: 120px !important;
    }

    .benefit-det.text-center .mega-blue {
      font-size: 14px;
      font-weight: 700;
    }

    .benefit-det {
      margin: 0 10px !important;
      width: 190px !important;
    }

    .mov-schedule {
      background: #0072bc;
    }

    .mov-schedule .row {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      padding: 50px;
    }

    .chan-mov {
      max-width: 100%;
      padding: 10px 20px;
      flex: 30%;
    }

    .chan-mov a {
      background: white;
      border-radius: 7px;
      width: 100%;
      height: 120px;
      padding: 20px;
      display: flex;
      text-align: center;
      justify-content: center;
      align-items: center;
    }

    .chan-mov a img {
      height: 50%;
      max-width: 100%;
    }

    .chan-mov a:hover, .chan-mov a:focus {
      background: rgba(255,255,255,0.8);
    }

    @media (max-width: 768px) {
      .chan-mov {
      max-width: 100%;
      padding: 10px 20px;
      flex: 50%;
    }

    .chan-mov a img {
      max-height: 50%;
      max-width: 100%;
    }
    }

    @media (max-width: 640px) {
      .chan-mov {
      max-width: 100%;
      padding: 10px 20px;
      flex: 100%;
    }

    .chan-mov a img {
      max-height: 50%;
      max-width: 100%;
    }
    }

    .check-opening {
      padding: 50px 0;
    }

    @media (max-width: 768px) {
    a.navbar-brand {
    float: left;
    }

    .check-input-grp {
        padding: 35px 20px;
    }

    .area-channel-sect {
        height: auto;
    }

    .navbar-default .navbar-nav>li>a {
        font-size: 14px;
    }

    .detail-caro1.blue-opa {
        width: 100%;
    }

    h2.det-title {
        font-size: 31px;
        color: white;
        text-align: center;
        width: 100%;
        padding-top: 25px;
    }

    .benefit-det {
        width: 175px;
        padding: 10px 5px 15px;
        margin: 10px 5px;
    }

    section.about-mega, .starnet-det.text-center {
        padding: 0 25px;
    }

    .singkatnya.blue-bg.col-xs-12.col-md-12 p {
        padding: 0 15px;
    }

    .col-md-7.col-xs-12 {
        padding: 10px 15px 15px;
    }

    .btn-group-vacan.col-md-3.col-sm-4.col-xs-6 {
        padding: 5px;
    }

    a.btn-vacan.col-xs-12.border-1px-white.no-padding {
        height: 240px;
    }

    a.btn-vacan.col-xs-12.border-1px-white.no-padding {
        height: 280px;
    }

    .btn-group-vacan a div div h3 {
        font-size: 20px;
    }

    .btn-group-vacan a span {
    margin: 0 15px 15px;
    color: white;
    padding: 5px;
    position: absolute;
    width: 95px;
    right: 5px;
    bottom: 5px;
    }

    .mega-benefit {
        margin-top: 35px;
        margin-bottom: 55px;
    }

    .channel-bdg, .channel-bogor {
        margin: 60px 0;
        padding: 5px;
    }
    }



    @media (max-width: 736px) {
    .product-list a {
        padding: 15px 14px;
        text-transform: uppercase;
        margin: 15px 6px;
    }

    .big-one {
        font-size: 65px;
    }

    .benefit-det {
        width: 160px;
        padding: 10px 3px 15px;
        margin: 3px 3px;
    }

    .other-vacan {
        padding: 55px 0px;
    }

    }



    @media(max-width: 640px) {
        .channel-btn-name {
        background: rgba(255,255,255,0.75);
        padding: 30px 20px;
        display: inline-block;
        color: #232323;
    }

    .mega-logo-tag img {
        height: 130px;
        margin-bottom: 20px;
    }

    .mega-logo-tag img {
        height: 130px;
        margin-bottom: 20px;
    }

    .navbar-brand img {
        height: 27px;
    }

    .channel-btn-name .font-18 {
        font-size: 14px;
    }

    .channel-btn-name .font-18 .font-24 {
        font-size: 18px;
    }
    }



    @media(max-width: 460px) {
    .channel-bdg, .channel-bogor {
        margin-top: 60px;
    }

    .title-channel-area {
        left: -1px;
    }

    .btn-group-vacan a span {
    margin: 0 15px 15px;
    color: white;
    padding: 5px;
    position: absolute;
    width: 95px;
    right: 5px;
    bottom: 5px;
    }

    a.btn-vacan.col-xs-12.border-1px-white.no-padding {
        height: 250px;
    }

    .check-opening h1 {
        font-size: 33px;
        margin-top: 33px;
    }

    .harga-paket {
        text-align: center;
        display: block;
        margin: 0 auto;
        width: auto;
        padding: 35px 30px;
    }

    .harga-paket a {
        margin: 0px 0 15px;
        width: 100%;
    }

    .channel-paket {
        margin: 0 auto;
        display: block;
        width: 100%;
    }

    .channel-paket li {
        margin: 0px 15px 0;
    }

    .channel-paket li a {
        padding: 20px 5px;
        width: 95px;
        font-size: 12px;
    }

    }

    @-moz-document url-prefix() {
    .citibank_btn {
    background:url("../images/citi.jpg");
    text-indent: -9999px;
    width: 75px;
    }
    }

    .col-md-3.col-md-offset-4.col-sm-6.col-sm-offset-3.well {
        width: 300px;
        margin: 0 auto;
        display: block;
        float: none;
    }

    /** responsive style active storage **/
    .panel-heading.single .row div div .col-sm-3 {
        margin: 10px 0;
    }

    @media (min-width: 1024px) {
    section.sec-package {
        height: auto;
    }

    section#sec-product .container, section.sec-package .container {
        position: relative;
        min-height: 100vh !important;
    }

    section#sec-product .row, section.sec-package .row {
        position: absolute;
        top: 50%;
        transform: translateY(-56%);
        width: 100% !important;
    }
    }

    .dropbtn {
        color: white;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 175px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {background-color: #ddd;}

    .dropdown:hover .dropdown-content {display: block;}

    .dropdown:hover .dropbtn {background-color: transparent;}

    .dropdown-content a {
        margin-left: 0 !important;
    }

    .benefit-img {
        width: 120px;
    }

    .benefit-det.text-center .mega-blue {
        font-size: 14px;
        font-weight: 700;
    }

    .benefit-det {
        margin: 0 10px !important;
        width: 190px !important;
    }

    .mov-schedule {
        background: #0072bc;
    }

    .mov-schedule .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 50px;
    }

    .chan-mov {
        max-width: 100%;
        padding: 10px 20px;
        flex: 30%;
    }

    .chan-mov a {
        background: white;
        border-radius: 7px;
        width: 100%;
        height: 120px;
        padding: 20px;
        display: flex;
        text-align: center;
        justify-content: center;
        align-items: center;
    }

    .chan-mov a img {
        height: 50%;
        max-width: 100%;
    }

    .chan-mov a:hover, .chan-mov a:focus {
        background: rgba(255,255,255,0.8);
    }

    .nav.navbar-nav.navbar-right.margin-0 {
        padding-top: 15px;
    }

    .check-opening {
        padding: 50px 0;
    }




    .mega-benefit {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }

    .chan-mov {
        max-width: 33%;
        padding: 10px 20px;
        flex: 33%;
    }

    .chan-mov a img {
        height: 75%;
        max-width: 100%;
    }

    .benefit-det {
        margin: 10px !important;
        width: 20%;
        align-items: center;
        flex: 20%;
        max-width: 20%;
    }


    @media (max-width: 768px) {
    .benefit-det {
        margin: 10px !important;
        width: 29%;
        align-items: center;
        flex: 29%;
        max-width: 29%;
    }
    }

    @media (max-width: 640px) {
    .benefit-det {
        margin: 10px !important;
        width: 45%;
        align-items: center;
        flex: 45%;
        max-width: 45%;
    }
    }

    @media (max-width: 768px) {
        .chan-mov {
        max-width: 50%;
        padding: 10px 20px;
        flex: 50%;
    }

    .nav.navbar-nav.navbar-right.margin-0 {
        padding-top: 0px;
    }

    .chan-mov a img {
        max-height:75%;
        max-width: 100%;
    }
    }

    @media (max-width: 640px) {
        .chan-mov {
        max-width: 50%;
        padding: 10px 20px;
        flex: 50%;
    }

    .chan-mov a img {
        max-height: 75%;
        max-width: 100%;
    }
    }

    .benefit-img {
        margin-bottom: 10px;
        width: 75% !important;
    }

    </style>',
    header: '<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-megavision" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/"><img src="/assets/logo.png"></a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-right" id="navbar-megavision">
        <ul class="nav navbar-nav navbar-right margin-0"> {{menu_content}}
        </ul>
        </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>',
      menu: '<li>{{link_to_menu}}</li>',
      dropdown_menu: '
      <li class="dropdown">
        <a class="dropbtn">{{dropdown_menu_title}}</a>
        <div class="dropdown-content">
          {{link_to_menu}}
        </div>
      </li>',
      footer: '<section class="floating-contact">
      <div id="accordion" role="tablist" aria-multiselectable="true">
        <div class="card">
          <div class="card-header" role="tab" id="headingOne">
              <a class="contact-float" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
                <h5>{{chat_title}}<span class="pull-right"><i class="fa fa-window-minimize" aria-hidden="true" style="font-size: 14px;"></i></span></h5>
              </a>
            </h5>
          </div>

          <div id="collapse1" class="collapse floating" role="tabpanel" aria-labelledby="headingOne" style="position: relative;">
            <div class="start-chat">
              <p>Tolong isi data terlebih dahulu</p>
              <div class="form-group contact-input">
                <label>Nama</label>
                <input type="text" name="name" class="form-control" placeholder="Nama" id="chat-name">
                </div>
              <div class="form-group contact-input">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Email" id="chat-email">
                </div>
              <div class="form-group contact-input">
                <label>Lokasi</label>
                <select name="location" class="form-control" id="chat-location">
                  {{option_channel}}
                </select>
              </div>
              <button class="submit-chat" id="submit-chat-info">Selesai</button>
            </div>
            <div class="white-form-group">
              <div class="chat-view">
                <p class="text-center {{chat_status}}">{{chat_off_message}}</p>
              </div>

              <div class="chat-input {{chat_status}}">
                <input class="full-input" rows="4" id="chat-message" type="text"  />
                <button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <footer class="footer bg-grey text-center">
      <a href="#beranda" class="bg-grey to-top white"><i class="fa fa-angle-double-up font-18" aria-hidden="true"></i></a>
      <p class="font-12 white">{{copyright_text}}</p>
      <a href="{{instagram_url}}" class="white social"><i class="fa fa-instagram font-24" aria-hidden="true"></i></a>
      <a href="{{facebook_url}}" class="white social"><i class="fa fa-facebook font-24" aria-hidden="true"></i></a>
      <a href="{{twitter_url}}" class="white social"><i class="fa fa-twitter font-24" aria-hidden="true"></i></a>
    </footer>

    <div class="alert {{notification-type}} notification" role="alert">
          {{notification_message}}
    </div>',
    js_tag: '
    <script type="text/javascript">
      $(document).on("turbolinks:load", function() {
        // reattach callback
        $(".notification").fadeTo(3000, 500).slideUp(500, function() {
          $(".notification").slideUp(500);
        });

        // smooth scroll
        $("a[href^=\"#\"]").on("click", function(e) {
          e.preventDefault();

          var hash = this.hash;

          if(!hash.includes("collapse") && !hash.includes("question") && !hash.includes("main-carousel")){
            $("html, body").animate({
              scrollTop: $(hash).offset().top
            }, 500, function() {
              window.location.hash = hash;
            });
          }

        });

        $(".datepicker").datepicker();
      });

      function formatAMPM(date) {
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? "pm" : "am";
        hours = hours % 12;
        hours = hours ? hours : 12; // the hour "0" should be "12"
        minutes = minutes < 10 ? "0"+minutes : minutes;
        var strTime = hours + ":" + minutes + " " + ampm;
        return strTime;
      }

    $(function() {
      // Initialize Firebase
      var config = {
        apiKey: "{{firebase_apiKey}}",
        authDomain: "{{firebase_authDomain}}",
        databaseURL: "{{firebase_databaseURL}}",
        projectId: "{{firebase_projectId}}",
        storageBucket: "{{firebase_storageBucket}}",
        messagingSenderId: "{{firebase_messagingSenderId}}"
      };

      var app;
      try {
        app = firebase.app();
      }
      catch(e) {
        app = firebase.initializeApp(config);
      }

      var newPostKey = firebase.database().ref().child("chats").push().key;

      if(localStorage.getItem("chat-date")){
        var date_split = localStorage.getItem("chat-date").split(" ")
        var date = date_split[1] + ", " + date_split[2] + " " + date_split[3];
        var temp_date = new Date(date);
        var message_date = temp_date.setDate(temp_date.getDate() + 3)
        var current_date = new Date();

        if(new Date(message_date) >= new Date() && localStorage.getItem("roomID") ){
          $(".start-chat").hide()
        }else{
          localStorage.removeItem("roomID");
        }
      }

      $("#btn-chat").click(function(){
          send_message()
      })

      $("#chat-message").keypress(function(e) {
          if($(this).val != "" && e.which == 13){
              send_message()
          }
      });

      var key = (localStorage.getItem("roomID")) ? localStorage.getItem("roomID") : newPostKey;
      var messageRef = firebase.database().ref("/chats/" + key + "/message");
      messageRef.on("child_added", function(snapshot) {
        var val = snapshot.val();
        $(".chat-view").append("<div class=\"talk-bubble "+val.type+" tri-right left-top\"> <div class=\"user-chat max-80 clearfix\">"+ val.message+"</div> <p class=\"time-chat\">"+ val.time+"</p> </div> ")
      });

      function send_message(){
        var message = $("#chat-message").val()

        if(message !== ""){
          if(localStorage.getItem("roomID") == null){
            firebase.database().ref("chats/" + newPostKey).set({
              username: localStorage.getItem("chat-name"),
              email: localStorage.getItem("chat-email"),
              location: localStorage.getItem("chat-location"),
              new: true,
              datetime: String(new Date())
            });

            localStorage.setItem("roomID", newPostKey);
          }

          var messageKey = firebase.database().ref().child("chats/" + localStorage.getItem("roomID") +"/message").push().key;
          firebase.database().ref("chats/" +  localStorage.getItem("roomID") +"/message/" + messageKey).set({
            username: localStorage.getItem("chat-name"),
            email: localStorage.getItem("chat-email"),
            location: localStorage.getItem("chat-location"),
            message: message,
            type: "user",
            time: formatAMPM(new Date())
          });

          $("#chat-message").val("")
        }
      }

      $("#submit-chat-info").click(function(){
          var name = $("#chat-name").val()
          var email = $("#chat-email").val()
          var location = $("#chat-location").val()

          if(name !== "" && email !== "" && location !== ""){
            localStorage.setItem("chat-name", name);
            localStorage.setItem("chat-email", email);
            localStorage.setItem("chat-location", location);
            localStorage.setItem("chat-date", new Date());
            $(".start-chat").hide()
          }
      });
    })
  </script>'
  })
end

unless MenuSetting.find_by_slug('product').present?
  menu =
    {
      menu: 'Product',
      type: 'MenuParent',
      position: 11,
      link_type: :scroll,
      is_active: false,
      html_content: '<section id="{{section_about}}" class="about-mega">
          <div class="container text-center">
            <div class="row">
              <div class="mega-logo-tag">
                <image src="/assets/logo-tag.png" />
              </div>
              <p>{{about_megavision}}</p>
              <div class="mega-benefit">
                {{about_product_megavision}}
              </div>
            </div>
          </div>
        </section>',
      html_additional: {
        about_product_html: '<div class="benefit-det text-center">
            <image src="{{product_image}}" class="benefit-img" alt="{{product_title}}" />
            <h5 class="mega-blue">{{product_description}}</h5>
          </div>',
            }
      }

    MenuSetting.create(menu)
end

vacancy = MenuSetting.find_by_slug('karir')

unless vacancy.html_additional[:vacancy_detail].present?
    html_additional = vacancy.html_additional
    html_additional[:vacancy_detail] = '<section class="vacancy-page">
            <div class="container">
                <div class="vacancy-detail col-xs-12">
                    <h3 class="bold vacan-title">{{vacancy_position}}</h3>
                    <p class="vacan-location">{{vacancy_location}}</p>
                    {{requirement_list}}
                </div>
            </div>
        
            <div class="container-fluid blue-bg other-vacan">
            <div class="container">
                {{vacancy_detail_list}}
            </div>
            </div>
        </section>'
    html_additional[:requirement_list] = '<p class="klasifikasi">{{requirement}}</p>'
    html_additional[:vacancy_detail_list] = '<div class="btn-group-vacan col-md-3 col-sm-4 col-xs-6">
    <a href="{{vacancy_link}}" class="btn-vacan col-xs-12 border-1px-white no-padding {{current_vacancy}}">
        <div class="text-center">
            <div class="border-bot-1px bg-white-opa"><h3>{{vacancy_position}}</h3></div>
                <div class="img-vacan">
                    <img src="{{vacancy_icon}}" />
                </div>
            <span class="border-1px-white pull-right">more-detail</span>
        </div>
    </a>
    </div>'

    vacancy.update({html_additional: html_additional})
end