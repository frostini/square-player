# frozen_string_literal: true

class HelloWorldComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end

end
