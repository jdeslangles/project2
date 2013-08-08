class PagesController < HighVoltage::PagesController

  layout :layout_for_page
  # before_filter :authenticate

  protected
    def layout_for_page
      case params[:id]
      when 'home'
        'home'
      else
        'application'
      end
    end
end
