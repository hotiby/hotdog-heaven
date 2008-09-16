class Daily < ActiveRecord::Base
  has_many :entries
  has_many :products, :through => :entries
  
end
