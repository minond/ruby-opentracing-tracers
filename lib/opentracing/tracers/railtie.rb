# frozen_string_literal: true

module OpenTracing
  module Tracers
    class Railtie < ::Rails::Railtie
      initializer "opentracing.tracers.configure_rails_initialization" do
        ::Rails.application.middleware.use ::OpenTracing::Tracers::Rack
      end
    end
  end
end
