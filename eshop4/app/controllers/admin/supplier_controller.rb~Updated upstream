class Admin::SupplierController < ApplicationController
  def new
      @supplier = Supplier.new
      @page_title = 'Create new author'
    end

    def create
      @supplier = Supplier.new(supplier_params)
      if @supplier.save
        flash[:notice] = "Supplier #{@supplier.name} was succesfully created."
        redirect_to :action => 'index'
      else
        @page_title = 'Create new author'
        render :action => 'new'
      end
    end

    def edit
      @supplier = Supplier.find(params[:id])
      @page_title = 'Edit author'
    end

    def update
      @supplier = Supplier.find(params[:id])
      if @supplier.update_attributes(supplier_params)
        flash[:notice] = "Supplier #{@supplier.name} was succesfully updated."
        redirect_to :action => 'show', :id => @supplier
      else
        @page_title = 'Edit supplier'
        render :action => 'edit'
      end
    end

    def destroy
      @supplier = Supplier.find(params[:id])
      @supplier.destroy
      flash[:notice] = "Succesfully deleted supplier #{@supplier.name}."
      redirect_to :action => 'index'
    end

    def show
      @supplier = Supplier.find(params[:id])
      @page_title = @supplier.name
    end

    def index
      @suppliers = Supplier.all
      @page_title = 'Listing suppliers'
    end

    private
      def supplier_params
        params.require(:supplier).permit(:first_name, :last_name)
      end
end
