class BusRoutesControllerTest < ActionController::TestCase

  test "index" do 
    get :index
    assert_response :success
    assert_select 'h1', "All Routes"
    assert_select 'td', "100"
  end

  test "show page" do
    get :show, id: 100
    assert_response :success
    assert_select 'h1', "Route 100"
    assert_select 'dl', /Total Boardings: 110.+/
    assert_select 'td' do |td|
      ['1','2'].include? td
    end
  end

end