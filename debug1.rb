class Animal
  def bark
    p "-----------------1------------------"
    p 'Yeah, it’s barking.'
  end
end

class Dog < Animal
  attr_accessor :name, :age

  def initialize(name, age=1)
    p "-----------------2------------------"

    @name = name
    @age = age
  end
end

class MechaDog < Dog

  def initialize(name, age=1)
    p "-----------------3------------------"

    super(name, age=1)
    @data = { 'apache' => 'apache', 'bsd' => 'mit', 'chef' => 'apache' }
  end

  def proc arg
    p "-----------------4------------------"
    path = (arg.split[0]).split('/')[1..-1]
    if path.nil?
      p "-----------------5.1------------------"
      keys=[]
      @data.each do |key, _value|
        keys << key
      end
      p keys
    elsif path.size == 2
      p "-----------------5.2------------------"
      @data[path[0].chomp] = path[1]
      p path[1]
    else
      p "-----------------5.3------------------"
      p path[0] + " => " + @data[path[0]].to_s
    end
  end

end


mdog = MechaDog.new('tom')
mdog.bark
p mdog.age
p mdog.name
mdog.proc "GET /bsd HTTP/1.1"
