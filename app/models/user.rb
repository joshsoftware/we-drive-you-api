class User < ApplicationRecord

  has_secure_password
  enum roles: {super_admin: 0, admin: 1, passanger: 2}

  def role
    User.roles.key(role_id)
  end
 
  def role
    User.roles.key(role_id)
  end

end
