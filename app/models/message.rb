# frozen_string_literal: true

class Message < ApplicationRecord
  validates :name, :email, :message, presence: true
end
