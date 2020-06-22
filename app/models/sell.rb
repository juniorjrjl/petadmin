class Sell < ApplicationRecord
  include Fae::BaseModelConcern
  validates :client, presence: true
  enum status: { finished:0, canceled: 1}

  belongs_to :discount
  belongs_to :client
  
  has_many :sell_products, dependent: :destroy
  has_many :products, through: :sell_products
  
  has_many :sell_services, dependent: :destroy
  has_many :services, through: :sell_services

  before_save :set_total
  
  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end

  private

  def set_total
    total = 0
    self.products.each{|p| total += p.price}
    self.services.each{|s| total += s.price}
    
    if self.discount.present?
      total = (self.discount.kind == 'money') ? total - self.discount.value : total - ((self.discount.value * total) / 100)
    end
    total = (total >= 0) ? total : 0
    self.total = total
  end

end
