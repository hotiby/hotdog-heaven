class Product < ActiveRecord::Base
  acts_as_state_machine :initial => :saved
  state :saved
  
  include Paperclip
  # Paperclip
  has_attached_file :photo,
      :styles => {
      :thumb  => "100x100",
      :small  => "150x150>" }
      
end
