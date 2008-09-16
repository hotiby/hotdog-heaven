class Product < ActiveRecord::Base
  acts_as_state_machine :initial => :saved
  state :saved
  has_many :entries
  has_many :dailies, :through => :entries
  
  include Paperclip
  # Paperclip
  has_attached_file :photo,
      :styles => {
      :thumb  => "100x100",
      :small  => "60x60>" }
      
      


  def add(items, daily, object, quantity = 1)
     day = Daily.find(daily) if daily
     exists = false
     items.each do |item|
       if item.product == object
         item.quantity += quantity
         item.save
         exists = true
       end
     end
     if !exists
       day.entries.create(:quantity => quantity, :product => object)
     end
   end
   
   
   def remove(daily, object, quantity = 1)
     day = Daily.find(daily) if daily
     items = Entry.find_all_by_daily_id(daily)
     items.each do |item|
       if item.product == object
         item.quantity -= quantity
          item.save
          if item.quantity < 1
            item.destroy
          end
        end
      end
    end

end
