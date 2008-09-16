class Entry < ActiveRecord::Base
  belongs_to :product
  belongs_to :daily
end
