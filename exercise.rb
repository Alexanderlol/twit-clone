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

=begin
-----------------------
CONSTRUCTOR EXERCISES
-----------------------
=end

r0 = (1..10)
r1 = Range.new(1,10)
puts r0.to_a
puts r1.to_a
puts r0 == r1

puts Range.superclass
puts Range.superclass.superclass
puts Hash.superclass
puts Hash.superclass.superclass
puts Symbol.superclass
puts Symbol.superclass.superclass

class Word < String
	def palindrome?
		self == reverse
	end
end
s = Word.new("level")
puts s.palindrome?

class User
	attr_accessor :name, :email

	def initialize(attributes = {})
		@name = attributes[:name]
		@email = attributes[:email]
	end

	def formatted_email
		"#{@name} <#{@email}>"
	end
end

ex = User.new
ex.name = "alex"
ex.email = "alex@email.com"
puts ex.formatted_email