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