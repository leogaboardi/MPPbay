addresses = [
  {
    :user_id => 1,
    :full_name => "My home",
    :address_line_1 => "Some street number 123",
    :address_line_2 => "Building A, Unit 123",
  },
    {
    :user_id => 1,
    :full_name => "Bat Cave",
    :address_line_1 => "Wayne Manor, 123",
    :city => "Gotham City",
    :state => "??",
    :zip => "55555",
    :country => "United States",
    :phone_number => "555-1234",

  },
      {
    :user_id => 1,
    :full_name => "White house",
    :address_line_1 => "1600 Pennsylvania Ave NW",
    :city => "Washington",
    :state => "DC",
    :zip => "20500",
    :country => "United States",
    :phone_number => "(202) 456-1111",

  },
]

addresses.each do |new_address|
  address = Address.new
  address.user_id = new_address[:user_id]
  address.full_name = new_address[:full_name]
  address.address_line_1 = new_address[:address_line_1]
  address.address_line_2 = new_address[:address_line_2]
  address.city = new_address[:city]
  address.state = new_address[:state]
  address.zip = new_address[:zip]
  address.country = new_address[:country]
  address.phone_number = new_address[:phone_number]
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

carts = [
  {
    :buyer_id => 1,
    :item_id => 10 # Nice 5 piece dining table available here at MPP (from Joker)
  },
    {
    :buyer_id => 1,
    :item_id => 9 #TV Stand available here at MPP (from Joker)
  },
    {
    :buyer_id => 1, #Robin
    :item_id => 8 # Queen mattress (from Robin)
  },
    {
    :buyer_id => 2,
    :item_id => 4
  }
]

carts.each do |new_cart|
  cart = Cart.new
  cart.buyer_id = new_cart[:buyer_id]
  cart.item_id = new_cart[:item_id]
  cart.save
end

categories = [
  { :name => "Home Decor",
    :level => 1
  },
  { :name => "Books",
    :level => 1,
  },
  { :name => "Furniture", # id 3
    :level => 2,
    :parent_id => 1
  },
    { :name => "Living room", # id 4
    :level => 3,
    :parent_id => 3

  },
  { :name => "Bedroom",
    :level => 3,
    :parent_id => 3
  }
]

categories.each do |new_category|
  category = Category.new
  category.name = new_category[:name]
  category.level = new_category[:levell]
  category.parent_id = new_category[:parent_id]
  category.save
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

items = [
    {
    :user_id => 1,
    :title => "2x2 Shelving unit",
    :description => "Kallax 2x2 shelving unit from IKEA",
    :item_url => "http://www.ikea.com/us/en/catalog/products/40275813/",
    :details => "Birch effect. Shelf in good conditions. Link shows original product from ikea",
    :category_1_id => 1,
    :category_2_id => 3,
    :category_3_id => 4,
    :status_id => 2,
    :condition_id => 2,
  },
  {
    :user_id => 1,
    :title => "3 place fabric sofa",
    :condition_id => 4,
    :description => "3 place, L shaped fabric sofa. Blue color",
    :status_id => 2,
    :category_1_id => 1,
    :category_2_id => 3,
    :category_3_id => 4,
    :details => "Sofa is worn, with stains and dirt in the textile (it is difficult to clean. No damage."
  },
  {
    :user_id => 2,
    :status_id => 1, #Draft
    :title => "Some smelly stuff"
  },
  {
    :user_id => 1,
    :title => "Coffee table",
    :status_id => 1, #Draft
    :description => "Used coffee table",
    :item_url => "http://www.ikea.com/us/en/catalog/products/40104294/#/10104295"
  },
    {
    :user_id => 1,
    :title => "Desk",
    :status_id => 2, #On sale
    :description => "Desk from Ikea",
    :item_url => ""
  },
    {
    :user_id => 1,
    :title => "Swivel chair",
    :status_id => 3,
    :description => "Chair from IKEA",
    :item_url => ""
  },
    {
    :user_id => 1,
    :title => "Desk lamp",
    :status_id => 4,
    :description => "Desk lamp from IKEA. Light bulb not included",
    :item_url => ""
  },
    {
    #Item.id: 8
    :user_id => 2,
    :title => "Queen mattress",
    :status_id => 2, #On sale
    :description => "Gently used and very clean - propped on my wall for a while. Thick 8 inch mattress"
  },
  {
    #Item.id: 9
    :user_id => 3,
    :title => "Nice 5 piece dining table available here at MPP",
    :status_id => 2, #On sale
    :description => "5 Piece table that has hardly been used. In great shape. Feel free to come by and look at them!"
  },
  {
    #Item.id: 10
    :user_id => 3,
    :title => "TV Stand available here at MPP",
    :status_id => 2, #On sale
    :details => "TV stand is only 5 months old. I paid $125 for the TV stand. The TV stand has all glass shelves with metal frames to support. It looks great. I am willing to part with it at a cost. I can help deliver both (with your help) to your house."
  }
]

items.each do |new_item|
  item = Item.new

  item.user_id = new_item[:user_id]
  item.title = new_item[:title]
  item.details = new_item[:details]
  item.description = new_item[:description]
  item.item_url = new_item[:item_url]
  item.status_id = new_item[:status_id]
  item.condition_id = new_item[:condition_id]
  item.handling_time = new_item[:handling_time]
  item.listing_duration = new_item[:listing_duration]
  item.available_at = new_item[:available_at]
  item.address_id = new_item[:address_id]
  item.category_1_id = new_item[:category_1_id]
  item.category_2_id = new_item[:category_2_id]
  item.category_3_id = new_item[:category_3_id]

  item.save
end

root = "C:/Dropbox/2015/Others/MPP Bay/pictures/"
pictures=[
  {:item_id => 1, #2x2 Shelving unit
    :image => root+"kallax-shelving-unit__0243996_PE383247_S4.JPG"
  },
  {:item_id => 4, #Coffee table
    :image => root+"lack-coffee-table__57536_PE163118_S4.JPG"
  },
  {:item_id => 5, #Desk
    :image => root+"malm-desk__0133379_PE288796_S4.JPG"
  },
  {:item_id => 6, #Swivel chair
    :image => root+"vilgot-swivel-chair-black__0113486_PE265710_S4.JPG"
  },
  {:item_id => 6, #Swivel chair
    :image => root+"20150323_203723.jpg"
  }
]

pictures.each do |new_picture|
  picture = Picture.new
  picture.item_id = new_picture[:item_id]
  picture.image = File.new(new_picture[:image])
  picture.default_picture = true
  picture.save
end


prices = [
  {:item_id => 1,
  :value => 12.99},
  {:item_id => 2,
  :value => 300},
  {:item_id => 3,
  :value => 10},
  {:item_id => 4,
  :value => 5.99},
  {:item_id => 8,
  :value => 80},
  {:item_id => 9,
  :value => 100},
  {:item_id => 10,
  :value => 70}
]

prices.each do |new_price|
  price = Price.new
  price.value = new_price[:value]
  price.item_id = new_price[:item_id]
  price.save
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

statuses = [
  {:label => "draft"},
  {:label => "on sale"},
  {:label => "sold"},
  {:label => "disabled"}
]

statuses.each do |new_status|
  status = Status.new
  status.label = new_status[:label]
  status.save
end

users = [
  {
    :name => "Leonardo",
    :email => "leonardo@example.com".downcase,
    :phone => "5555555",
    :admin => true,
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
