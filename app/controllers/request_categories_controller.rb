class RequestCategoriesController < InheritedResources::Base

  private

    def request_category_params
      params.require(:request_category).permit(:service_category_id, :fields_attributes => [:name, :field_type, :required, :id, "_destroy"])
    end
end

