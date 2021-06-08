class User < ApplicationRecord
    has_secure_password 
    validates_uniqueness_of :email, :on => :create, :message => "must be unique"
end
