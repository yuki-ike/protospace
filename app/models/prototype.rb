class Prototype < ActiveRecord::Base

  has_many :contents
  accepts_nested_attributes_for :contents

end
