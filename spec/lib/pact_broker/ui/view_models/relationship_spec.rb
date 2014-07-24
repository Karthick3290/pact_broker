require 'spec_helper'
require 'pact_broker/ui/view_models/relationship'

module PactBroker
  module UI
    module ViewModels
      describe Relationship do

        let(:consumer) { instance_double("PactBroker::Models::Pacticipant", name: 'consumer_name')}
        let(:provider) { instance_double("PactBroker::Models::Pacticipant", name: 'provider_name')}
        let(:relationship) { PactBroker::Models::Relationship.new(consumer, provider)}

        subject { Relationship.new(relationship) }

        its(:consumer_name) { should eq 'consumer_name'}
        its(:provider_name) { should eq 'provider_name'}
        its(:latest_pact_url) { should eq "/pacts/provider/provider_name/consumer/consumer_name/latest" }

        describe "<=>" do

          let(:relationship_model_4) { double("PactBroker::Models::Relationship", consumer_name: "A", provider_name: "X") }
          let(:relationship_model_2) { double("PactBroker::Models::Relationship", consumer_name: "a", provider_name: "y") }
          let(:relationship_model_3) { double("PactBroker::Models::Relationship", consumer_name: "A", provider_name: "Z") }
          let(:relationship_model_1) { double("PactBroker::Models::Relationship", consumer_name: "C", provider_name: "A") }

          let(:relationship_models) { [relationship_model_1, relationship_model_3, relationship_model_4, relationship_model_2] }
          let(:ordered_view_models) { [relationship_model_4, relationship_model_2, relationship_model_3, relationship_model_1] }

          let(:relationship_view_models) { relationship_models.collect{ |r| Relationship.new(r)} }

          it "sorts by consumer name then provider name" do
            expect(relationship_view_models.sort.collect{ |r| [r.consumer_name, r.provider_name]})
              .to eq([["A", "X"],["a","y"],["A","Z"],["C", "A"]])
          end

        end

      end
    end
  end
end