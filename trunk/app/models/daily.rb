class Daily < ActiveRecord::Base
  has_many :entries
  has_many :products, :through => :entries
  validates_presence_of :date, :on => :create, :message => "field cant be blank"
  validates_presence_of :name, :on => :create, :message => "field cant be blank"
  validates_presence_of :total, :on => :create, :message => "field cant be blank"
  
end
