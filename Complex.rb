#!/usr/bin/ruby
class ComplexNumber

    #class variable to calculator count
    @@counter= {"add_counter"=>0,"multiply_counter"=>0}
    #@@counter=0
  
    #setter && getter for real and imaginary part
    attr_accessor :real, :img
  
    #constructor to initialize real and imaginary
    def initialize(real, img)
      @real = real
      @img = img
    end
  
    #override the + function to allow add complex
    def + (complex_number)
      @@counter["add_counter"] += 1
      #@@counter += 1
      real = @real + complex_number.real
      img  = @img  + complex_number.img
      ComplexNumber.new(real, img)
    end
  
    #override the * function to allow multiply complex
    def *(other)
      @@counter["multiply_counter"] += 1
      #@@counter += 1
      real = @real * other.real - @img * other.img
      img  = @real * other.img + @img * other.real
      ComplexNumber.new(real, img)
    end
  
    #bulk_add from array
    def self.bulk_add(complex_array)
      result = complex_array.first
      complex_array.drop(1).each do |complex_number|
        result += complex_number
      end
      result
    end
  
    #bulk_multiply from array
    def self.bulk_multiply(complex_array)
      result = complex_array.first
      complex_array.drop(1).each do |complex_number|
        result *= complex_number
      end
      result
    end
  
    # override to default to_string function
    def to_s
      "(#{self.real} + #{self.img}i)"
    end
  
    #get_state to count how many time we call the calculator
    def self.calculator_operations_count()
      puts "No of Add Operations: #{@@counter["add_counter"]}"
      puts "NO of Multiply Operations #{@@counter["multiply_counter"]}"
      #puts "No of #{@@counter}"
    end
  
  end
  
  complex_number1 = ComplexNumber.new(3, 2)
  complex_number2 = ComplexNumber.new(1, 7)
  complex_number3 = ComplexNumber.new(4, 3)
  complex_number4 = ComplexNumber.new(5, 7)

  
  puts complex_number1 + complex_number2
  puts complex_number1 * complex_number2
  
  #array operation
  array_of_complex_numbers = [complex_number1, complex_number2, complex_number3, complex_number4]
  
  puts ComplexNumber.bulk_add(array_of_complex_numbers)
  puts ComplexNumber.bulk_multiply(array_of_complex_numbers)
  
  #get the count
  ComplexNumber.calculator_operations_count()