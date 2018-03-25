Category.destroy_all

category_list = [
  { name: "景點"},
  { name: "美食"},
  { name: "交通"},
  { name: "購物"}
]

category_list.each do |category|
  Category.create( name: category[:name])  
end

puts "Category created!"

