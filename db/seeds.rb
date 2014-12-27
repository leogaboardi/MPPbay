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


