class ServiceCategoriesController < InheritedResources::Base

  private
    def service_category_params
      params.require(:service_category).permit(:name, :fields_attributes => [:name, :field_type, :required, :id, "_destroy"])
    end
end

