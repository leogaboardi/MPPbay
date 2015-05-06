N_USERS = 10  #Number of users
N_ADDRESSES = 30  #Number of addresses
N_ITEMS = 100 #Number of items
P_CART =  0.1 #Probability of an item belonging to the users cart
P_OFFER =  0.05 #Probability of an item belonging to the users cart


addresses = []

N_ADDRESSES.times do |n|
  addresses << {
  :user_id => rand(1..N_USERS),
  :full_name => "Address #{n+1}",
  :address_line_1 => "Line 1 for address #{n+1}",
  :address_line_2 => "Line 2 for address #{n+1}",
  :city => "City #{n+1}",
  :state => "State #{n+1}",
  :zip => "Zip #{n+1}",
  :country => "Country #{n+1}",
  :phone_number => "Phone number #{n+1}",
  }
end

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

carts = []
N_USERS.times do |user|
  N_ITEMS.times do |item|
    if (rand(0..100).to_f/100 <= P_CART)
      carts << {
      :buyer_id => user+1,
      :item_id => item+1
      }
    end
  end
end

carts.each do |new_cart|
  cart = Cart.new
  cart.buyer_id = new_cart[:buyer_id]
  cart.item_id = new_cart[:item_id]
  cart.save
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

items = []

  N_ITEMS.times do |n|
    items << {
    :user_id => rand(1..N_USERS),
    :title => "item #{n+1}",
    :description => "Description of item #{n+1}",
    :details => "Some description of the item #{n+1}",
    :category_1_id => 1,
    :condition_id => rand(1..4),
    :status_id => rand(1..4),
    :price => rand(0..99999).to_f/100
    }
  end

items.each do |new_item|
  item = Item.new
  item.user_id = new_item[:user_id]
  item.title = new_item[:title]
  item.details = new_item[:details]
  item.description = new_item[:description]
  item.item_url = new_item[:item_url]
  item.price = new_item[:price]
  case new_item[:user_id]
  when 7
    item.status_id = 1
  when 8
    item.status_id = 2
  when 9
    item.status_id = 3
  when 10
    item.status_id = 4
  else
    item.status_id = new_item[:status_id]
  end
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

offers = []
N_USERS.times do |user|
  N_ITEMS.times do |item|
    if (rand(0..100).to_f/100 <= P_OFFER)
      offers << {
      :buyer_id => user+1,
      :item_id => item+1
      }
    end
  end
end

offers.each do |new_offer|
  offer = Offer.new
  offer.buyer_id = new_offer[:buyer_id]
  offer.item_id = new_offer[:item_id]
  offer.save
end

root = "C:/Dropbox/2015/Others/mppbay/pictures/"
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

users = [
  {
    :name => "Leonardo",
    :email => "leonardo@example.com".downcase,
    :phone => "5555555",
    :admin => true,
  }
]

  N_USERS.times do |n|
    users << {
    :name =>  "user#{n+1}",
    :email => "user#{n+1}@example.com",
    :admin => false,
    :phone => "5555555"
    }
  end

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
