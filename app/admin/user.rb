ActiveAdmin.register User do
scope :client
scope :guest
scope :all


actions :index, :show
  index do
    id_column
    column :name 
    column :nickname
    column :email
    column :role
  
=begin
    column '0 Pendientes' do |u|
        u.orders.pending.size
      end
      column '0 Pagadas' do |u|
        u.orders.paid.size
      end
      column '0 Canceladas' do |u|
        u.orders.cancel.size
      end
    
=end
  end
end
