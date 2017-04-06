=begin
-----------------------
BLOCK EXERCISES
-----------------------
=end

def yeller(arr = [])
	arr.map(&:upcase).join
end

puts yeller(['o', 'l', 'd'])

def random_subdomain
	('a'..'z').to_a.shuffle[0..7].join
end

puts random_subdomain

def string_shuffle(s)
	s.split('').shuffle.join
end

puts string_shuffle("foobar")

=begin
-----------------------
HASH AND SYMBOL EXERCISES
-----------------------
=end

h1 = {one: "uno", two: "dos", three: "tres"}

h1.each do |k,v|
	puts "#{k} in spanish is #{v}"
end

person1 = { :first => "sandra", :last => "stj" }
person2 = { :first => "alex", :last => "afe" }
person3 = { :first => "jade", :last => "dog" }

params = {}

params[:mother] = person1
params[:me] = person2
params[:dog] = person3

puts params[:mother][:first]
puts params[:me][:first]
puts params[:dog][:first]

hash1 = { name: "alex", email: "alex@example.com", password: ('a'..'z').to_a.shuffle[0..15].join }

puts hash1







