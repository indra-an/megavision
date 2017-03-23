module ApplicationHelper
  def class_for_content_indicator(_controller, _action_1 = nil, _action_2 = nil)
    controller.controller_name.eql?(_controller.to_s) &&
      (_action_1.nil? || controller.action_name.eql?(_action_1.to_s) ||
        controller.action_name.eql?(_action_2.to_s)) ? 'active' : ''
  end

  def format_number_to_price_tag(number)
    thousands = number.to_i / 1000
    hundreds = number.to_i - (thousands * 1000)
    hundreds = hundreds == 0 ? '000' : hundreds.to_s
    raw '<sup class="font-18">Rp</sup>' + number_with_delimiter(thousands, :delimiter => '.') +
        '.<sup class="font-18">' + hundreds + '</sup><sub class="font-12">/BLN</sub>'
  end
end
