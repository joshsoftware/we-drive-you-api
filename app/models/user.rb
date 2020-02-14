class User < ApplicationRecord

  has_secure_password
  enum roles: {super_admin: 0, admin: 1, passenger: 2}

  def role
    User.roles.key(role_id)
  end
 
  def is_super_admin?
    role=="super_admin"
  end

  def is_admin?
    role=="admin"
  end

  def is_passenger?
    role=="passenger"
  end

end
