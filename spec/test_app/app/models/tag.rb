class Tag < ActiveRecord::Base
  acts_as_tree dependent: :destroy, order: :id, name_column: :id
end
