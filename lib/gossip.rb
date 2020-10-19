require 'pry' 
require 'csv'

class Gossip

    attr_accessor :author, :content, :counter

    

    def initialize (author, content)
        @author = author
        @content = content
        @counter = counter
       
    end

    def save
        @counter = 0
            CSV.open("./db/gossip.csv", "ab") do |csv|
              csv << ["#{@author}", "#{@content}"]
              @counter += 1
            end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end
end
