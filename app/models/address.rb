class Address < ApplicationRecord
  include Fae::BaseModelConcern

  belongs_to :client, touch: true

  def fae_nested_parent
    :client
  end
  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end

  belongs_to :client
end
