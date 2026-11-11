require "spec_helper"

describe Bunny::Socket do
  describe ".open" do
    it "uses TCPSocket for DNS resolution" do
      socket = Object.new
      allow(socket).to receive(:setsockopt)
      expect(TCPSocket).to receive(:new).with("rabbitmq.internal", 5672).and_return(socket)

      result = described_class.open("rabbitmq.internal", 5672, keepalive: false)

      expect(result).to be(socket)
    end
  end
end
