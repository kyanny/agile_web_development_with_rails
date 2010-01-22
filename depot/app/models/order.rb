# -*- coding: utf-8 -*-
class Order < ActiveRecord::Base
    has_many :line_items
    PAYMENT_TYPES = [
        ["現金", "check"],
        ["クレジットカード", "cc"],
        ["注文書", "po"],
    ]
end
