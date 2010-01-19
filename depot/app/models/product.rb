# -*- coding: utf-8 -*-
class Product < ActiveRecord::Base
    validates_presence_of :title, :description, :image_url
    validates_numericality_of :price
    validate :price_must_be_at_least_a_cent
    validates_uniqueness_of :title
    validates_format_of :image_url, :with => %r{\.(gif|jpe?g|png)$}i, :message => 'は GIF, JPG, PNG 画像の URL でなければなりません'
    validates_length_of :title, :minimum => 10

    def price_must_be_at_least_a_cent
        errors.add(:price, "は最小でも 0.01 以上でなければなりません") if price.nil? || price < 0.01
    end
end
