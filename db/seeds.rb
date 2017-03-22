# clear data
Admin.destroy_all

# seeding
Admin.create({ :email => 'admin@megavision.com', :password => 'megavision2017' })
