# -*- coding: utf-8 -*-
class User < ActiveRecord::Base

    validates_presence_of :name
    validates_uniqueness_of :name

    attr_accessor :password_confirmation
    validates_confirmation_of :password

    validate :password_non_blank

    private

    def password_non_blank
        errors.add(:password, "パスワードを入れてください") if hashed_password.blank?
    end
end
