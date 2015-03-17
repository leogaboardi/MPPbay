users = [
  {
    :name => "Leonardo",
    :email => "leonardo@example.com".downcase,
    :phone => "5555555",
    :admin => true,
  },
  {
    :name => "Batman",
    :email => "bruce_wayne@example.com".downcase,
    :admin => true,
    :phone => "5555555"
  },
    {
    :name => "Robin",
    :email => "robin@example.com".downcase,
    :admin => false,
    :phone => "5555555"
  },
    {
    :name => "Joker",
    :email => "joker@example.com".downcase,
    :admin => false,
    :phone => "5555555"
  },
    {
    :name => "Gordon",
    :email => "gordon@example.com".downcase,
    :admin => false,
    :phone => "5555555"
  },
    {
    :name => "Penguin",
    :email => "penguin@example.com".downcase,
    :admin => false
  },
    {
    :name => "Riddler",
    :email => "riddler@example.com".downcase,
    :admin => false
  },
  {
    :name => "2 Faces",
    :email => "2faces@example.com".downcase,
    :admin => false
  },
  {
    :name => "Poison Ivy",
    :email => "poisonivy@example.com".downcase,
    :admin => false
  },
  {
    :name => "John Doe",
    :email => "jdoe@example.com".downcase,
    :admin => false
  }
]

users.each do |new_user|
  user = User.new
  user.email = new_user[:email]
  user.name = new_user[:name]
  user.phone = new_user[:phone]
  user.admin = new_user[:admin]
  user.password = "password"
  user.password_confirmation = "password"
  user.save
end

items = [
  {
    :user_id => 1,
    :title => "Old accounting book"
  },
    {
    :user_id => 2,
    :title => "Batcar"
  },
  {
    :user_id => 2,
    :title => "Batman Gadget"
  },
  {
    :user_id => 2,
    :title => "Some smelly stuff"
  },
]

items.each do |new_item|
  item = Item.new
  item.user_id = new_item[:user_id]
  item.title = new_item[:title]
  item.save
end

favorites = [
  {
    :user_id => 1,
    :item_id => 1
  }
]

favorites.each do |new_favorite|
  favorite = Favorite.new
  favorite.user_id = new_favorite[:user_id]
  favorite.item_id = new_favorite[:item_id]
  favorite.save
end

addresses = [
  {
    :user_id => 1,
    :full_name => "My home",
    :address_line_1 => "Some street number 123",
    :address_line_2 => "Building A, Unit 123",
  }
]

addresses.each do |new_address|
  address = Address.new
  address.user_id = new_address[:user_id]
  address.full_name = new_address[:full_name]
  address.address_line_1 = new_address[:address_line_1]
  address.address_line_2 = new_address[:address_line_2]
  address.save
end

availabilities = [
  {
    :name => "Example",
    :email_filter => "@example.com"
  }
]

availabilities.each do |new_availability|
  availability = Availability.new
  availability.name = new_availability[:name]
  availability.email_filter = new_availability[:email_filter]
  availability.save
end

purchases = [
  {
    :item_id => 1,
    :buyer_id => 1,
    :seller_id => 2
  },
  {
    :item_id => 2,
    :buyer_id => 1,
    :seller_id => 3
  },
  {
    :item_id => 2,
    :buyer_id => 3,
    :seller_id => 4
  }
]

purchases.each do |new_purchase|
  purchase = Purchase.new
  purchase.item_id = new_purchase[:item_id]
  purchase.seller_id = new_purchase[:seller_id]
  purchase.buyer_id = new_purchase[:buyer_id]
  purchase.save
end

conditions = [
  {:label => "Brand new"},
  {:label => "Used, but like new"},
  {:label => "Used, some wear"},
  {:label => "Considerable wear / some damage"}
]

conditions.each do |new_condition|
  condition = Condition.new
  condition.label = new_condition[:label]
  condition.save
end

buildings = [
  {:label => "Millenium Park Plaza",
    :address_line_1 => "151 N Michigan ave",
    :city => "Chicago",
    :state => "IL",
    :zip => "60601",
    :country => "United States"
  }
]

buildings.each do |new_building|
  building = Building.new
  building.label = new_building[:label]
  building.address_line_1 = new_building[:address_line_1]
  building.city = new_building[:city]
  building.state = new_building[:state]
  building.zip = new_building[:zip]
  building.country = new_building[:country]
  building.save
end

statuses = [
  {:label => "available"},
  {:label => "sold"},
  {:label => "disabled"}
]

statuses.each do |new_status|
  status = Status.new
  status.label = new_status[:label]
  status.save
end
