require 'spec_helper.rb'

describe FullName do
  include FullName
  
  [['Benoit', 'Gantaume', :en, 'Benoit Gantaume'],
   ['benoit', 'gantaume', :en, 'Benoit Gantaume'],
   ['Benoit', '', :en, 'Benoit'],
   ['benoit', '', :en, 'Benoit'],
   ['Benoit', nil, :en, 'Benoit'],
   ['', 'Gantaume', :en, 'Gantaume'],
   ['', 'gantaume', :en, 'Gantaume'],
   [nil, 'Gantaume', :en, 'Gantaume'],
   [nil, nil, :en, ''],

   ['', 'gantaume', :fr, 'GANTAUME'],
   ['Benoit', 'Gantaume', :fr, 'GANTAUME, Benoit'],
   ['benoit', 'gantaume', :fr, 'GANTAUME, Benoit'],
   ['benoit', '', :fr, 'Benoit'],
   ].each do |params|
    context 'parametric' do
      let(:first_name) { params[0] }
      let(:last_name) { params[1] }
      it 'aggregates both' do
        expect(full_name(params[2])).to eq(params[3])
      end
    end
  end

  context 'using locales' do
    let(:first_name) { 'Benoit' }
    let(:last_name) { 'Gantaume' }
    
    it 'returns :en locale by default' do
      expect(full_name).to eq(full_name(:en))
    end

    it 'returns :en when using unknown locale' do
      expect(full_name(:unknown)).to eq(full_name(:en))
    end
  end

end
