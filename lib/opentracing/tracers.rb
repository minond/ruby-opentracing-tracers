# frozen_string_literal: true

require "opentracing/tracers/version"

module OpenTracing
  module Tracers
    # @param [String] service_name
    # @param [Hash] config
    # @param [Jaeger::Sampler] sampler
    # @param [Jaeger::Client::Reporter] reporter
    # @return [Jaeger::Client]
    def self.build_jaeger_client(
      service_name,
      config: Rails.application.config.jaeger,
      sampler: build_jaeger_sampler,
      reporter: build_jaeger_reporter(service_name, config)
    )
      Jaeger::Client.build(
        :host => config[:host],
        :port => config[:port],
        :service_name => service_name,
        :sampler => sampler,
        :reporter => reporter,
      )
    end

    # @return [Jaeger::Samplers::Const]
    def self.build_jaeger_sampler
      Jaeger::Samplers::Const.new(true)
    end

    # @param [String] service_name
    # @param [Hash] config
    # @return [Jaeger::Client::Reporters::RemoteReporter]
    def self.build_jaeger_reporter(service_name, config)
      Jaeger::Client::Reporters::RemoteReporter.new(
        :flush_interval => config[:flush_interval],
        :sender => Jaeger::UdpSender.new(
          :host => config[:host],
          :port => config[:port],
          :max_packet_size => config[:max_packet_size],
          :logger => Logger.new(STDOUT),
          :encoder => Jaeger::Encoders::ThriftEncoder.new(
            :service_name => service_name
          )
        )
      )
    end
  end
end
