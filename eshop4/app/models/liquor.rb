
class Liquor < ActiveRecord::Base
    has_and_belongs_to_many :suppliers
    belongs_to :producer

    has_many :cart_items
    has_many :carts, :through => :cart_items

    has_attached_file :cover_image
    validates_attachment :cover_image,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

    validates_length_of :name, :in => 1..255, :message => 'Error en la longitud del nombre'
    validates_presence_of :producer, :message => 'Error productor requerido'
    validates_presence_of :suppliers, :message => 'Error proveedor requerido'
    validates_presence_of :produced_at, :message => 'Error en la fecha de producción'
    validates_numericality_of :price, :message => 'Error en el precio'
    validates_length_of :serial_number, :in => 1..5, :message => 'Error en la longitud del numero de serie'
    validates_uniqueness_of :serial_number, :message => 'Error en la unicidad del numero de serie'


  def supplier_names
    self.suppliers.map{|supplier| supplier.name}.join(", ")
  end

  def self.latest(num)
    all.order("liquors.id desc").includes(:suppliers, :producer).limit(num)
  end
end
