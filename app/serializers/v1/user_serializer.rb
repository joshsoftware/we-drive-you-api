# frozen_string_literal: true

module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email_id
  end
end
