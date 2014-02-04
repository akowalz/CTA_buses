class BusStopsControllerTest < ActionController::TestCase 

  test "index page" do
    get :index
    assert_response :success
    assert_select 'h1', "All Bus Stops"
    assert_select 'td', "1"
    assert_select 'td', "2"
    assert_select 'td', "RIDGE"
  end

  test "show page" do
    get :show, id: 1
    assert_response :success
    assert_select 'h1', "Bus Stop 1"
    assert_select 'a' do |a|
      ['100','101'].include? a
    end 
  end

  test "stop counts" do
    get :stopcounts
    assert_response :success
    assert_select 'th', "Stop ID"
    assert_select 'th', '# of Routes'
    assert_select 'a', '1'
    assert_select 'a', '2'
  end
end