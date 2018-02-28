#! /bin/ruby
# -*- coding: utf-8 -*-

# Dependencies' declaration
require_relative 'internal_documentation'
require_relative 'internal_commands'

# Declaring a dummy commands' category
module RME
  module Command
    module Event

      Command::declare({:name => :move_to,
                        :section => self,
                        :description => 'event.move_to',
                        :parameters => [
                          {:name        => :id,
                           :description => 'event.eventId',
                           :type        => ParameterType::PositiveInteger},
                          {:name        => :x,
                           :description => 'event.x',
                           :type        => RME::Command::ParameterType::Coordinate},
                          {:name        => :y,
                           :description => 'event.y',
                           :type        => RME::Command::ParameterType::Coordinate},
                          {:name        => :ghostly,
                           :description => 'event.ghostly',
                           :type        => RME::Command::ParameterType::Boolean,
                           :default     => false}
                        ]}) { |id, x, y, ghostly| puts "Moving event n°#{id} to (#{x}, #{y}) (ghostly? #{ghostly})" }
    end
  end
end

# Command's invocation's illustration
puts "Command's invocation (Event::move_to):\n"
RME::Command::Event::move_to(11, 27, 32)

puts "\n"

# Commands' documentation's generation
puts "RME commands' documentation (JSON) in english:\n"
puts "#{RME::Doc::generate}\n\n"

puts "RME commands' documentation (JSON) in french:\n"
puts "#{RME::Doc::generate('fr')}\n"

