require './lib/library'
require 'pry'


describe Books do
  

  it 'Check if the list book exist' do
     expect(File.exist?('./lib/books_list.yml')).to be_truthy
  end
  
  it 'search by title' do
    expected_output = [{:item=>{:title=>"Under a Starry Sky", :author=>"Laura Kemp"}, :available=>true, :return_date=>nil, :withdraw_by=>nil}]
    expect(subject.serch_by_title('Under a Starry Sky')).to eq expected_output
  end

  it 'search for all available books' do
    subject.available_books do |book|
      expect(book[:available]).to be_truthy
    end
  end
  
  it 'book withdrawal check' do
    expected_output = {:item=>{:title=>"Disappearing Earth", :author=>"Julia Phillips"}, :available=>false, :return_date=>"09/20", :withdraw_by=>"facundo"}
    expect(subject.book_withdrawal('Disappearing Earth', 'facundo')).to eq expected_output
  end

  it 'book return check' do
  expected_output = {:item=>{:title=>"Disappearing Earth", :author=>"Julia Phillips"}, :available=>true, :return_date=>nil, :withdraw_by=>nil}
  expect(subject.return_of_books('Disappearing Earth', 'facundo')).to eq expected_output
  end
end

=begin


  Tests: file exist?        done
        return date
        title eq to title   done
        all books available?
it 'wefsfgewfdv' do
    expected_date = 'Disappearing Earthddddd'
    expect(subject.check_list).to eq expected_date
  end


=end
